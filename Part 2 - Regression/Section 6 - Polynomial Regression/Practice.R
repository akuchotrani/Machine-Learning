#import dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#training linear regressor
linear_regressor = lm(formula = Salary ~ .,
                      data = dataset)

#training poly regressor
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_regressor = lm(formula = Salary ~ .,
                    data = dataset)

#visualising linear regression
library(ggplot2)
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(linear_regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff(Linear Regression') + 
  xlab('Level') +
  ylab('Salary')

#visualizing the poly regression
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red')+
  geom_line(aes(x = dataset$Level, y = predict(poly_regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('truth of bluff(poly regression)')+
  xlab('Level')+
  ylab('salary')

#predict new value
y_pred = predict(linear_regressor,data.frame(Level = 6.5))

#predict with poly regression
y_pred = predict(poly_regressor,data.frame(Level = 6.5,
                                           Level2 = 6.5^2,
                                           Level3 = 6.5^3,
                                           Level4 = 6.5^4))

