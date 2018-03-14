library(shiny)
library(deSolve)

server <- function(input, output){

    ## Function to current solution of LV
    lvModel <- function(t, state, pars) {
        with(as.list(c(state, pars)), {
            dx <- alpha * x - beta * x * y
            dy <- delta * x * y - gamma * y
            return(list(c(dx, dy)))
        })
    }

    times <- seq(0, 20, length = 201)

    soln <- reactive({
        init_state <- c(x = input$x, y = input$y)
        given_pars <- c(alpha = input$alpha,
                        beta = input$beta,
                        gamma = input$gamma,
                        delta = input$delta)
        deSolve::ode(init_state, times, lvModel, given_pars)
    })

    output$timeline <- renderPlot({
        out <- soln()
        opar <- par(mfrow = c(1, 2))
        matplot(out[ , 1], out[ , 2:3], type = "l",
                xlab = "Time", ylab = "Numbers",
                main = "Humans vs. Zombies!", lwd = 2, lty = 1,
                col = c("green", "red"))
        legend("topright", c("Humans", "Zombies"),
               col = c("green", "red"), lty = 1, lwd = 2, bty = "n")
        polygon(out[, 2], out[, 3])
        par(opar)
    }, height = 500)

    ## output$phase <- renderPlot({
    ##     out <- soln()
    ##     n <- nrow(out)
    ##     ## segments(out[seq_len(n - 1), 2], out[seq_len(n - 1), 3],
    ##     ##          out[seq_len(n - 1) + 1, 2], out[seq_len(n - 1) + 1, 3])
    ##     points(out[, 2], out[, 3])
    ## }, height = 400)
    
}
