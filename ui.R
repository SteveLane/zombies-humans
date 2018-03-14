library(shiny)
library(deSolve)

exTxt <-
    'This simple application allows you to simulate a zombie invasion! Using the sliders, you can see how changing certain values affects the zombie and human population.

See if you can use the sliders to make the humans beat the zombies by time 20! (Hint: you\'ll need to have the red line go flat (to 0) by time 20.'

fluidPage(
        
    ## Application title
    titlePanel("Zombies vs. Humans!"),
    
    sidebarLayout(
        ## Sidebar with a slider input
        sidebarPanel(
            sliderInput(
                "x",
                "Starting number of humans",
                value = 10,
                min = 1,
                max = 200,
                step = 1
            ),
            sliderInput(
                "y",
                "Starting number of zombies",
                value = 5,
                min = 1,
                max = 200,
                step = 1
            ),
            sliderInput(
                "alpha",
                "Human strength (growth rate)",
                value = 0.5,
                min = 0,
                max = 3,
                step = 0.01
            ),
            sliderInput(
                "beta",
                "Zombie attack rate",
                value = 0.05,
                min = 0,
                max = 1,
                step = 0.01
            ),
            sliderInput(
                "gamma",
                "Zombie cure rate",
                value = 0.5,
                min = 0,
                max = 1,
                step = 0.01
            ),
            sliderInput(
                "delta",
                "Zombie strength rate",
                value = 0.05,
                min = 0,
                max = 1,
                step = 0.01
            )
        ),
     
        ## Show a plot of the solution
        mainPanel(
            fluidRow(
                column(8, p(exTxt, style = "color:blue; font-size: 20px;"))
            ),
            ## fluidRow(
            ##     column(4, plotOutput("timeline")),
            ##     column(4, plotOutput("phase"))
            ## )
            fluidRow(
                plotOutput("timeline")
            )
        )
        
    )

    ## Change
    ## includeCSS("~/github/Website/css/app.css")
)
