#SERVER.R
# Server is a function used to render the objects created in the User Interface function of the shiny Application
# It takes the input and output as an argument
server=function(input,output){
  
  PopInput <- reactive({
    (input$Pop)
  })
  
  clInput <- reactive({
    (input$cl)
  })
  
  meInput <- reactive({
    (input$me)
  })
  
  erInput <- reactive({
    (input$er)
  })
  
  output$sample_size<- renderTable({  
    
    N=reactive({PopInput()})
    if (input$cl==99){z= 2.58}
    if (input$cl==95){z= 1.96}
    if (input$cl==90){z=1.65}
    e=reactive({meInput()})
    eper=as.numeric(e())/100
    p=0.5
    # Find the sample size 
    samp_si_p= ((z^2)*(p*(1-p)))/eper^2
    samp_si_m= 1+(((z^2)*(p*(1-p)))/((eper^2)*as.numeric(N())))
    sampleSize=samp_si_p/samp_si_m
    
    # people need to invite 
    # percentage of expected response rate 
    res_rate=reactive({erInput()})
    resper=as.numeric(res_rate())/100
    peop_invite=sampleSize/resper
    resul=data.frame(Sample_size=sampleSize,people_to_invite=peop_invite)
    resul
  })
}