#Uppper Confidence Bound

#Importing the dataset
dataset = read.csv("Ads_CTR_Optimisation.csv")

#Implementing UCB
d = 10
numbers_of_selections = integer(d)
sums_of_rewards = integer(d)
total_reward = 0

#step 2
N = 10000
ads_selected = integer()
for(n in 1:N)
{
  ad = 0
  max_upper_bound = 0
  for(i in 1:d)
  {
    if(numbers_of_selections[i]>0)
    {
      average_reward = sums_of_rewards[i]/numbers_of_selections[i]
      delta_i = sqrt(3/2 * log(n)/numbers_of_selections[i])
      upper_bound = average_reward + delta_i
    }
    else
    {
      upper_bound = 1e400
    }
    
    
    if(upper_bound > max_upper_bound)
    {
      max_upper_bound = upper_bound
      ad = i
    }
  }
  
  ads_selected = append(ads_selected,ad)
  numbers_of_selections[ad] = numbers_of_selections[ad] + 1 
  reward = dataset[n,ad]
  sums_of_rewards[ad] = sums_of_rewards[ad] + reward
  total_reward = total_reward + reward
}


#visualizing the results - creating Histogram
hist(ads_selected,
     col = 'blue',
     main = 'Histogram of ads selections',
     xlab = 'Ads',
     ylab = 'number of times each ad was selected')

