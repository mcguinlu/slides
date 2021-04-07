library(ggplot2)
library(tidyr)
library(dplyr)
library(medrxivr)

t <- mx_snapshot()

t2 <- mx_search(t,"*") %>%
  select(authors) %>%
  separate(authors, into = c(paste0("V",1:300)), sep = ";", fill = "left",remove = TRUE)
  
t3 <- data.frame(stack(t2[1:300])) %>%
  filter(!is.na(values) & values != "") %>%
  group_by(values) %>%
  summarise(number = n()) %>%
  ungroup() %>%
  arrange(desc(number)) %>%
  head(50) %>%
  mutate(ind = c(rep(FALSE,49),TRUE))

p <- ggplot(t3, aes(number, reorder(values, number), fill = ind)) + 
  geom_col() +
  scale_fill_manual(values = c("#808080", "black")) +
  scale_x_continuous(expand = c(0,0)) +
  labs(x = "Number of preprints",
       y = "Author", 
       title = "Top 50 preprinting authors (out of 108565 authors)") + 
  theme_minimal() +
  theme(legend.position = "none")


ggsave(p, filename = "21-04-06-IEU-medrxivr/figs/author_plot.png")

