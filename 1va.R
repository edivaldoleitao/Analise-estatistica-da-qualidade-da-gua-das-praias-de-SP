  library(tidyverse)
  library(magrittr) # biblioteca para usar o pipe
  library(dplyr)
  library(readxl)
  library(readr)
  library(ggplot2)
  library(rmarkdown)
  library(knitr)
  
  df <- readxl::read_excel("sp_beaches.xlsx") %>%
             filter(City == "ILHA COMPRIDA") %>%
             mutate(Enterococcus = as.numeric(Enterococcus)) %>%
             group_by(Beach) %>%
             summarize(media_Enterococcus = mean(Enterococcus), 
                       mediana_Enterococcus = median(Enterococcus),
                       maximo_Enterococcus = max(Enterococcus),
                       minimo_Enterococcus = min(Enterococcus),
                       Q1_Enterococcus = quantile(Enterococcus,0.25),
                       Q3_Enterococcus = quantile(Enterococcus,0.75),
                       Desvio_padrao = sd(Enterococcus),
                       Qtd_amostras = NROW(Enterococcus)) %>%
                mutate(perc = prop.table(Qtd_amostras))
  
  #coloca as cores como variaveis a partir de Beach 
  bar<-ggplot(data=df,aes(x= reorder(Beach, -Qtd_amostras),
                        y=Qtd_amostras, fill=Beach, label=scales::percent(perc))) +
    geom_bar(stat = "identity", width = 0.5) +
    geom_text(aes(x = Beach, y = Qtd_amostras), 
              vjust = 0.0,
              size = 4, 
              hjust =  0.0,
              color='black') +
  xlab('Beach')
  bar
    
  pie <- ggplot(df, aes(x="", y=Qtd_amostras, fill=Beach,)) +
  geom_bar(stat="identity", width=1, color="white") +
  theme_void() +
  geom_col() +
  geom_label(aes(label= scales::percent(perc)), show.legend = FALSE,
             position = position_stack(vjust = 0.5)) +
  coord_polar("y", start = 0)
  pie 
  
  hist <- readxl::read_excel("sp_beaches.xlsx") %>%
    filter(City == "ILHA COMPRIDA") %>%
    mutate(Enterococcus = as.numeric(Enterococcus)) %>%
    group_by(Beach) %>% 
    ggplot(aes(x=Enterococcus, color=Beach, fill=Beach)) +
    geom_histogram(position = 'identity', bins = 30, alpha=0.5)
    hist
    
  box <- readxl::read_excel("sp_beaches.xlsx") %>%
    filter(City == "ILHA COMPRIDA") %>%
    mutate(Enterococcus = as.numeric(Enterococcus)) %>%
    group_by(Beach) %>% 
    ggplot(aes(x=Beach, y=Enterococcus, color=Beach)) +
    geom_boxplot()
    box

    # salva os dados do dataset e gráficos para serem carregados no arquivo de markdown
    save(df, file = "C:/Users/Win10/Documents/df.Rdata")
    save(bar, file = "C:/Users/Win10/Documents/bar.Rdata")
    save(hist, file = "C:/Users/Win10/Documents/hist.Rdata")
    save(pie, file = "C:/Users/Win10/Documents/pie.Rdata")
    save(box, file = "C:/Users/Win10/Documents/box.Rdata")
    
                