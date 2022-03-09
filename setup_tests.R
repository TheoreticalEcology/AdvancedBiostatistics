source("tests/utils.R")

#### INFO #####
# All chunks will be tested within a testthat::test_that environment.
# To skip chunks, use purl=FALSE in chunk options.
# For successful debugging, please name all chunks. 
# Chunk names+arguments will be used as names for tests.

# 1. Specify Rmds to test:
rmds = c("book/index.Rmd",
         "book/02_R-reminder.Rmd",
         "book/03-recap.Rmd",
         "book/04-heteroskedasticity.Rmd",
         "book/05-GLMMs.Rmd",
         "book/06-correlation.Rmd",
         "book/07-causal_inference.Rmd",
)[c(1,2,3,4,5,6,7)]

# 2. Create tests
.n = sapply(rmds, create_test)
Sys.sleep(5)

# 3. Run tests
testthat::test_dir("tests/")

# 4. Clean/delete tests
files = list.files("tests/", pattern = "test-*", full.names = TRUE)
file.remove(files)
