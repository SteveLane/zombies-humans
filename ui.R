library(shiny)
library(deSolve)

exTxt <-
    "This simple calculator shows the sample size required to detect \\(m \\geq 1\\) infected units, from a lot with design prevalence \\(p\\). The number of infected units in the sample follows a hypergeometric distribution, given the number of infected units in the lot. Because of the requirement to use an integer number of infected units, the design prevalence is translated into the number of infected units in the lot, rounded down. This gives an <em>apparent</em> prevalence, lower than required design prevalence (a good thing &#12483;)."

fluidPage(
    
    ## Need mathjax
    withMathJax(),
    
    ## Application title
    titlePanel("Sample size calculation for infected unit detection."),
    
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
                column(8, h3("Description"), HTML(exTxt))
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
