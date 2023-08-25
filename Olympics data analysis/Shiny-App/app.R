source("helpers.R")

ui <- dashboardPage(
  skin = 'purple',
  dashboardHeader(title = "Olympics",
                  titleWidth = 400),
  
  dashboardSidebar(
    
    sidebarMenu(
      
      menuItem("Introduction", 
               tabName = "page1",
               icon = icon("table")),
      
      menuItem("Race for Medals",
               tabName = "page2",
               icon = icon("table")),
      
      menuItem("Evolution of Medals",
               tabName = "page3",
               icon = icon("table")),
      
      menuItem("Olympics Data",
               tabName = "page4",
               icon = icon("table")),
      
      menuItem("Distribution",
               tabName = "page5",
               icon = icon("table")),
      
      menuItem("Interesting Factors",
               tabName = "page6",
               icon = icon("table")),
      menuItem("Source Code",
               icon = icon('table'),
               href = "https://github.com/dootika/group-project-group-22.git")
    )
  ),
  
  dashboardBody(
    
    # tag$head(
    #   tag$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    # ),
    # 
    
    tabItems(
      
      tabItem(tabName = "page1",
              fluidRow(
                
                column(
                  width = 8,
                  box(
                    width = NULL,
                    title = "Athletes count",
                    status = "info",
                    solidHeader = T,
                    collapsible = T,
                    img(src = "my_animation.gif", width = "550px", height = "400px")
                  )
                ),
                column(
                  width = 4,
                  box(
                    width = NULL,
                    status = "info",
                    solidHeader = T,
                    collapsible = T,
                    img(src = "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Indian_Olympic_Association_logo.svg/1200px-Indian_Olympic_Association_logo.svg.png", width = "270px", height = "400px")
                  )
                )
              ),
              fluidRow(
                box(title = "Total number of Nations and Events over time.",
                    width = 12,
                    status = "info",
                    solidHeader = T,
                    collapsible = T,
                    plotOutput("page1_plot1")
                )
              )
      ),
      
      tabItem(tabName = "page2",
              fluidRow(
                
                column(width = 4,
                       box(width = NULL,
                           title = "Controls",
                           status = "purple",
                           solidHeader = T,
                           collapsible = T,
                           checkboxGroupInput("page2_countries",
                                              h3("Select The Countries You to want to see : "),
                                              choices = unique(dat$Nation),
                                              selected = unique(dat$Nation)[1:10]))),
                
                column(width = 8,
                       box(width = NULL,
                           title = "Let's Visualize",
                           status = "purple",
                           solidHeader = T,
                           collapsible = T,
                           plotOutput("page2_plot1")),
                       
                       box(width = NULL,
                           title = "Olympic Gold Medals are mostly made of Silver",
                           status = "purple",
                           solidHeader = T,
                           collapsible = T,
                           plotOutput("page2_plot2")),
                       
                       box(width = NULL,
                           title = "Do you know where the first olympics was held",
                           status = "purple",
                           solidHeader = T,
                           collapsible = T,
                           plotOutput("page2_plot3")),
                       
                       box(width = NULL,
                           title = "Athens 1896",
                           status = "purple",
                           solidHeader = T,
                           collapsible = T,
                           plotOutput("page2_plot4"))
              ))),
      
      tabItem(tabName = "page3",
              fluidRow(
                box(title = "Controls",
                    width = 12,
                    status = "info",
                    solidHeader = T,
                    collapsible = T,
                    selectInput("page3_country",
                                h3("Select Your Favourite Country :) "),
                                choices = unique(dat_year$Nation),
                                selected = "United States"))
              ),
              
              fluidRow(
                box(title = paste("Let's ", "study the ",'"BIAS"'),
                    width = 12,
                    status = "info",
                    solidHeader = T,
                    collapsible = T,
                    plotOutput("page3_plot1"))
              ),
      ),
      
      tabItem(tabName = "page4",
              setBackgroundImage(
                src = "https://png.pngtree.com/thumb_back/fh260/background/20190221/ourmid/pngtree-purple-background-simple-style-psd-source-file-line-image_18848.jpg",
                shinydashboard = TRUE
              ),
              tags$head(
                tags$link(rel = "stylesheet", type = "text/css", href = "olympics.css")
              ),
              
              # Application title
              titlePanel(div("Historical Data from the Olympic Games", style = "color: white")),
              
              # Sidebar with various radioButtons and selectInputs
              sidebarLayout(
                sidebarPanel(
                  img(src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSErugll867TNuFt-IHdLPqFFbZk_pUlKK-gk8O59FI8Pal3-eNsDU1GIOmUtYXocThcQ&usqp=CAU", height = 110, width = 260),
                  radioButtons(inputId = "season",
                               label = "Select season",
                               choices = c("Summer", "Winter")),
                  selectInput(inputId = "year",
                              label = "Select year",
                              choices = sort(unique(olympics$year))),
                  selectInput(inputId = "sport", label = "Select a sport",
                              choices = sort(unique(olympics$sport))),
                  selectInput(inputId = "event", label = "Select an event",
                              choices = sort(unique(olympics$event)))
                ),
                
                # Show a plot of the top medal winning teams and a medal summary table
                mainPanel(
                  #span(textOutput("intro"),style = 'color:white'),
                  #plotOutput(outputId = "barchart"),
                  fluidRow(
                    box(title = textOutput("intro"),
                        width = 12,
                        status = "info",
                        solidHeader = T,
                        collapsible = T,
                        plotOutput("barchart"))
                  ),
                  fluidRow(
                    box(title = textOutput("info"),
                        width = 12,
                        status = "info",
                        solidHeader = T,
                        collapsible = T,
                        dataTableOutput('table'))
                  ),
                )
              )),
      
      tabItem(tabName = "page5",
              fluidRow(
                box(title = "Controls",
                    width = 12,
                    status = "maroon",
                    solidHeader = T,
                    collapsible = T,
                    selectInput("page5_country",
                                h3("Select Your Favourite Country :) "),
                                choices = unique(dat_year$Nation),
                                selected = "Greece"))
              ),
              
              fluidRow(
                box(title = "Let's Study the Distribution",
                    width = 12,
                    status = "maroon",
                    solidHeader = T,
                    collapsible = T,
                    plotOutput("page5_plot1"))
              ),
              
              fluidRow(
                box(width = 12,
                    title = "Average Height of a Male olympian is 1.82 m",
                    status = "maroon",
                    solidHeader = T,
                    collapsible = T,
                    plotOutput("page5_plot2"))
              ),
              
              fluidRow(
                box(
                  width = 12,
                  title = "Average Height of a Female olympian is 45.27 Kg",
                  status = "maroon",
                  solidHeader = T,
                  collapsible = T,
                  plotOutput("page5_plot3")
                )
              )
      ),
      
      tabItem(tabName = "page6",
              fluidRow(
                box(width = 4,
                    title = "Life Expectancy (Cor = 0.3983424)",
                    status = "primary",
                    solidHeader = T,
                    collapsible = T,
                    plotOutput("page6_plot1")),
                
                box(width = 4,
                    status = "black",
                    title = "Beer Price (in USD) (Cor = 0.3507118)",
                    solidHeader = T,
                    collapsible = T,
                    plotOutput("page6_plot2")),
                
                box(width = 4,
                    status = "info",
                    title = "Per Capita Alchol Consumption (Cor = 0.3381)",
                    solidHeader = T,
                    collapsible = T,
                    plotOutput("page6_plot3"))
              ),
              
              fluidRow(
                box(width = 4,
                    status = "warning",
                    title = "Year of Independence (Cor = -0.3535347)",
                    solidHeader = T,
                    collapsible = T,
                    plotOutput("page6_plot4")),
                
                box(width = 4,
                    status = "danger",
                    title = "Suicide Rate (Cor = 0.1870489)",
                    solidHeader = T,
                    collapsible = T,
                    plotOutput("page6_plot5")),
                
                box(width = 4,
                    status = "navy",
                    title = "Rate of Unemployment (Cor = -0.2284803)",
                    solidHeader = T,
                    collapsible = T,
                    plotOutput("page6_plot6")),
                
              ),
              
              fluidRow(
                box(width = 4,
                    status = "purple",
                    title = "Literacy Rate (Cor = 0.2616936)",
                    solidHeader = T,
                    collapsible = T,
                    plotOutput("page6_plot7")),
                
                
                box(width = 4,
                    status = "orange",
                    title = "Forest Area (Cor = 0.1100886)",
                    solidHeader = T,
                    collapsible = T,
                    plotOutput("page6_plot8")),
                
                box(width = 4,
                    status = "maroon",
                    title = "Population (Cor = -0.021650)",
                    solidHeader = T,
                    collapsible = T,
                    plotOutput("page6_plot9"))
              ))
      
    )
  )
)

server <- function(input, output, session){
  
  ##
  # page1
  output$page1_plot1 <- renderPlot({
    
    p2 <- ggplot(counts, aes(x=Year, y=Nations, group=interaction(Season,gap), color=Season)) +
      geom_point(size=2) +
      geom_line() +
      scale_color_manual(values=c("darkorange","darkblue"))+
      labs(y = "#Nations")+
      theme(
        axis.title = element_text(face = "bold",
                                  size = 20),
        axis.text = element_text(face = "bold",
                                 size = 15)
      )
    
    p3 <- ggplot(counts, aes(x=Year, y=Events, group=interaction(Season,gap), color=Season)) +
      geom_point(size=2) +
      geom_line() +
      scale_color_manual(values=c("darkorange","darkblue"))+
      labs(x = "Year",
           y = "#Events")+
      theme(
        axis.title = element_text(face = "bold",
                                  size = 20),
        axis.text = element_text(face = "bold",
                                 size = 15)
      )
    
    grid.arrange(p2, p3, ncol=1)
  })
  ##
  
  ##
  # page2
  
  sub2 <- reactive({
    subset(dat, Nation %in% input$page2_countries)
  })

  output$page2_plot1 <- renderPlot({
    
    temp <- sub2()
    plot2_total(temp)
  })
  
  output$page2_plot2 <- renderPlot({
    
    temp <- sub2()
    plot2_gold(temp)
  })
  
  output$page2_plot3 <- renderPlot({
    
    temp <- sub2()
    plot2_silver(temp)
  })
  
  output$page2_plot4 <- renderPlot({
    
    temp <- sub2()
    plot2_bronze(temp)
  })
  
  
  ##
  
  ##
  # page3
  
  output$page3_plot1 <- renderPlot({
    country = input$page3_country
    dat <- subset(dat_year, Nation == country)
    bias <- subset(dat, HostNation == country)
    
    plot_host(dat, bias, country)
  })
  
  
  ##
  
  ##
  # page4
  observeEvent(input$season,
               {
                 
                 updateSelectInput(session, "year",
                                   choices = olympics %>% filter(season == input$season) %>% 
                                     distinct(year) %>% arrange(year) %>% pull()
                 )
                 updateSelectInput(session, "sport",
                                   choices = olympics %>% filter(season == input$season) %>%  
                                     distinct(sport) %>% arrange(sport) %>% pull(sport))
                 updateSelectInput(session, "event",
                                   choices = olympics %>% filter(season == input$season) %>%  
                                     distinct(event) %>% arrange(event) %>% pull(event))
               }
  )
  
  observeEvent(input$year,
               {
                 
                 updateSelectInput(session, "sport",
                                   choices = olympics %>% filter(year == input$year,
                                                                 season == input$season) %>%  
                                     distinct(sport) %>% arrange(sport) %>% pull(sport))
                 updateSelectInput(session, "event",
                                   choices = olympics %>% filter(year == input$year,
                                                                 season == input$season) %>%  
                                     distinct(event) %>% arrange(event) %>% pull(event))
               }
               
  )
  observeEvent(input$sport,
               {
                 updateSelectInput(session, "event",
                                   choices = olympics %>% filter(year == input$year,
                                                                 season == input$season,
                                                                 sport == input$sport) %>%  
                                     distinct(event) %>% arrange(event) %>% pull(event))
               }
  )
  output$barchart <- renderPlot({
    barchartdata <-
      olympics %>%
      filter(!is.na(medal),
             year == input$year, 
             season == input$season) %>%
      mutate(team = gsub('-[0-9]+', '', team)) %>%
      distinct(team, event, medal) %>%
      count(team, medal) %>% 
      mutate(medal = factor(medal, levels = c("Gold", "Silver", "Bronze"))) %>% 
      group_by(team) %>%
      arrange(medal) %>% 
      ungroup() %>% 
      add_count(team, wt = n, name = "num_medals") %>% 
      mutate(rank = dense_rank(desc(num_medals))) 
    
    barchartdatatop <-
      barchartdata %>%
      filter(rank %in% 1:5) 
    
    if (length(unique(barchartdatatop$team)) > 10){
      barchartdatatop <-
        barchartdata %>%
        filter(rank %in% 1:3) 
    }
    
    barchartdatatop %>% 
      ggplot(aes(x = reorder(team, -num_medals), y = n, fill = medal)) +
      geom_bar(stat = "identity", position = "stack") +
      theme_minimal() +
      geom_text(aes(label = paste0(n, " ", medal)), position = position_stack(vjust = 0.5), 
                color = "white", size = 4, fontface = "bold") +
      stat_summary(fun = sum, aes(label = paste(..y.., "medals"), group = team), 
                   geom = "text", vjust = -.3, size = 5) +
      labs(title = paste0("Top ", length(unique(barchartdatatop$team)), " Teams in the ", input$year, " ", input$season, 
                          " Olympic Games"),
           x = "Team",
           y = "Number of Medals Won") +
      scale_fill_manual("legend", values = c("Gold" = "gold", "Silver" = "#C0C0C0", 
                                             "Bronze" = "#cd7f32")) + 
      theme(legend.position = "none") 
    
  })
  
  # reactive data set
  event_table <- reactive({
    olympics %>%
      filter(!is.na(medal),
             year == input$year,
             season == input$season,
             event == input$event) %>% 
      mutate(Team = gsub('-[0-9]+', '', team),
             Medal = factor(medal, levels = c("Gold", "Silver", "Bronze"))) %>%
      distinct(event, Team, Medal) %>% 
      arrange(Medal) %>% 
      rename(Event = event)
  })
  
  output$table <- renderDataTable({
    DT::datatable(event_table(), 
                  options = list(dom = 't',
                                 initComplete = JS(
                                   "function(settings, json) {",
                                   "$(this.api().table().header()).css({'background-color': 'black', 'color': 'white'});",
                                   "}")
                  )
    )
  })
  
  olympic_location <- reactive({
    olympics_countries %>% 
      filter(year == input$year,
             season == input$season) %>% 
      distinct(city, country) %>%
      mutate(location = paste0(city, ", ", country)) %>% 
      pull(location)
  })
  
  olympic_teams <- reactive({
    olympics %>% 
      filter(year == input$year,
             season == input$season) %>% 
      mutate(team = gsub('-[0-9]+', '', team)) %>% 
      distinct(team) %>% 
      nrow()
  })
  
  output$intro <- renderText({ 
    paste0("The ", input$year, " ", input$season, 
           " Olympic Games were held in ", 
           olympic_location(), ".",
           " A total of ", olympic_teams(), " teams participated in the games."
    )
  })
  output$info <- renderText({
    paste0(input$year, input$season, input$event,
          "Olympics Medal Summary", sep = " ")
  })
  
  ##
  
  ##
  # page5
  
  output$page5_plot1 <- renderPlot({
    nation <- input$page5_country
    dat <- subset(haw, Nation == nation)
    plot_age(dat, nation)
  })
  
  output$page5_plot2 <- renderPlot({
    nation <- input$page5_country
    dat <- subset(haw, Nation == nation)
    plot_height(dat, nation)
  })
  
  output$page5_plot3 <- renderPlot({
    nation <- input$page5_country
    dat <- subset(haw, Nation == nation)
    plot_weight(dat, nation)
  })
  ##
  
  ##
  # page6
  
  output$page6_plot1 <- renderPlot({
    plot_lifeExp()
  })
  
  output$page6_plot2 <- renderPlot({
    plot_beer()
  })
  
  output$page6_plot3 <- renderPlot({
    plot_alcohol()
  })
  
  output$page6_plot4 <- renderPlot({
    plot_indep()
  })
  
  output$page6_plot5 <- renderPlot({
    plot_suicide()
  })
  
  output$page6_plot6 <- renderPlot({
    plot_unemployment()
  })
  
  output$page6_plot7 <- renderPlot({
    plot_lit()
  })
  
  output$page6_plot8 <- renderPlot({
    plot_forest()
  })
  
  output$page6_plot9 <- renderPlot({
    plot_pop()
  })
  ##
}

shinyApp(ui, server)