#reading the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#fitting the regression(Decision tree resgression)
install.packages('rpart')
library(rpart)

regressor = rpart(formula = Salary ~.,
                  data = dataset,
                  control = rpart.control(minsplit = 1))

#prediting the new result
y_pred = predict(regressor,data.frame((Level = 6.5)))

#visualizing the result
library(ggplot2)

ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red')+
  geom_line(aes(x = dataset $Level, y = predict(regressor,newdata = dataset)),
            colour = 'blue')+
  ggtitle('truth or bluff(decision tree)')+
  xlab('levels')+
  ylab('salary')


#smooth visualization
library(ggplot2)
x_grid = seq(min(dataset$Level),max(dataset$Level),0.01)
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red')+
  geom_line(aes(x = x_grid, y = predict(regressor,newdata = data.frame(Level = x_grid))),
            colour = 'blue')+
  ggtitle('decision tree smooth')+
  xlab('level')+
  ylab('salary')