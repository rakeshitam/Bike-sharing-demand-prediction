install.packages("ggplot2")
library(ggplot2)
# Sample data frame
df <- data.frame(
  Rented_Bike_Count = c(500, 1000, 1500, 2000, 2500, 3000, 3500),
  Temperature = c(-20, -10, 0, 10, 20, 30, 40)
)
# Fit the model
model <- lm(Temperature ~ Rented_Bike_Count, data = df)
df$predicted_temperature <- predict(model, newdata = df)
# Plotting with ggplot2
ggplot(df, aes(x = Rented_Bike_Count, y = Temperature)) +
  geom_point(color = 'blue', size = 3) +  # Plot the data points
  geom_line(aes(y = predicted_temperature), color = 'red', size = 1) +  # Add the regression line
  labs(
    title = 'Linear Regression: Rented Bike Count vs Temperature',
    x = 'Rented Bike Count',
    y = 'Temperature (°C)'
  ) +
  theme_minimal() +  # Use a minimal theme for better aesthetics
  theme(
    plot.title = element_text(hjust = 0.5),  # Center the title
    axis.title = element_text(size = 12)  # Increase axis title size
  )