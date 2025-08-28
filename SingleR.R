library(SingleR)
library(celldex)

expr <- read.csv("D:/Downloads/expression_matrix_for_SingleR (1).csv", row.names = 1, check.names = FALSE)
expr_mat <- as.matrix(expr)

hpca <- HumanPrimaryCellAtlasData()

singleR_hpca <- SingleR(test = expr_mat, ref = hpca, labels = hpca$label.main)

final_results <- data.frame(
  Cell = colnames(expr_mat),
  HPCA_label = singleR_hpca$labels,
  stringsAsFactors = FALSE
)

write.csv(final_results, "SingleR_HPCA_results.csv", row.names = FALSE)