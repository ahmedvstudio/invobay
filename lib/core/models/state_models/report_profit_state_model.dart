class ProfitStats {
  final double totalSales;
  final double totalCOGS;
  final double profit;
  final bool isLoading;
  final bool hasError;

  double get profitMargin {
    if (totalSales == 0) return 0;
    return (profit / totalSales) * 100;
  }

  const ProfitStats({
    required this.totalSales,
    required this.totalCOGS,
    required this.profit,
    this.isLoading = false,
    this.hasError = false,
  });

  const ProfitStats.loading()
      : totalSales = 0.0,
        totalCOGS = 0.0,
        profit = 0.0,
        isLoading = true,
        hasError = false;

  const ProfitStats.error()
      : totalSales = 0.0,
        totalCOGS = 0.0,
        profit = 0.0,
        isLoading = false,
        hasError = true;
}
