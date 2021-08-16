library(shiny)

ui_req <- NULL
ui_xfwd <- NULL

ui <- function(req) {
  if ("HTTP_X_FORWARDED_FOR" %in% ls(req)) 
    ui_xfwd <<- req[["HTTP_X_FORWARDED_FOR"]]
    ui_req <<- paste(ls(req), collapse = "\n")
  fluidPage(
    h3("UI req(request) 변수 리스트"),
    verbatimTextOutput("req_list"),
    h3("HTTP_X_FORWARDED_FOR 출력"),
    verbatimTextOutput("xff")
  )
}

server <- function(input, output, session) {
  
  output$req_list <- renderPrint({
    cat(ui_req)
  })
  
  output$xff <- renderPrint({
    cat("Clinet IP :", ui_xfwd)
  })
  
}

shinyApp(ui, server)

# 참고 코드 #
# 출처 : https://github.com/rstudio/rsconnect/issues/214
# library(shiny)
# 
# ui_xfwd <- 'No value'
# 
# ui <- function(req) {
#   if ("HTTP_X_FORWARDED_FOR" %in% ls(req)) ui_xfwd <<- req[["HTTP_X_FORWARDED_FOR"]]
#   fluidPage(
#     h3("UI req"),
#     paste(ls(req), collapse = " "),
#     h3("server session$request"),
#     textOutput("request"),
#     h3("result"),
#     uiOutput("result")
#   )
# }
# 
# server <- function(input, output, session) {
#   output$request <- renderText({
#     paste(ls(session$request), collapse = " ")
#   })
#   
#   output$result <- renderUI({
#     if ("HTTP_X_FORWARDED_FOR" %in% ls(session$request)) {
#       div(
#         p("HTTP_X_FORWARDED_FOR header present in server:"),
#         p(session$request[["HTTP_X_FORWARDED_FOR"]])
#       )
#     } else if (!is.null(ui_xfwd)) {
#       div(
#         p("HTTP_X_FORWARDED_FOR header present in UI:"),
#         p(ui_xfwd),
#         p(session$request[["REMOTE_ADDR"]])
#       )
#     } else {
#       div(
#         p("HTTP_X_FORWARDED_FOR header not present in UI or server; here's the REMOTE_ADDR:"),
#         p(session$request[["REMOTE_ADDR"]])
#       )
#     }
#   })
# }
# 
# shinyApp(ui, server)
