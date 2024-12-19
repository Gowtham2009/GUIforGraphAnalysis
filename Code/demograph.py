import matplotlib.pyplot as plt
import numpy as np

# Generate example stock data
np.random.seed(42)
days = np.arange(1, 31)  # Simulating 30 days of stock prices
base_price = 100  # Starting stock price
price_changes = np.random.normal(0, 2, size=30)  # Daily price changes
prices = base_price + np.cumsum(price_changes)

# Plotting the stock data
plt.figure(figsize=(10, 6))
plt.plot(days, prices, label='Stock Price', color='blue', marker='o', linestyle='-', linewidth=2, markersize=5)
plt.title('Stock Market Demo - 30 Days Trend', fontsize=14)
plt.xlabel('Day', fontsize=12)
plt.ylabel('Price ($)', fontsize=12)
plt.xticks(fontsize=10)
plt.yticks(fontsize=10)
plt.grid(alpha=0.5)
plt.legend(fontsize=12)
plt.tight_layout()

# Show the plot
plt.show()
