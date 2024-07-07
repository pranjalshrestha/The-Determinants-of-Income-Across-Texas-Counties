// Load the dataset
use "/Users/pranjal/Documents/ECO 390/Project/Final Paper/ShresthaPData.dta"

// Summary statistics
summarize

// Ordinary Least Squares (OLS) regression of medinc on various predictors
regress medinc bachelors grad unemprate forborn age65over white male mgmtocc sales construction production

// Check for multicollinearity using information criteria
estat ic

// Transform medinc into natural logarithm lnmedinc
gen lnmedinc = ln(medinc)

// OLS regression of lnmedinc on predictors
reg lnmedinc bachelors grad unemprate forborn age65over white male mgmtocc sales construction production

// Check for multicollinearity after transformation
estat vif

// Separate regressions focusing on subsets of predictors
reg lnmedinc bachelors unemprate forborn age65over white male mgmtocc sales construction production
reg lnmedinc bachelors unemprate forborn age65over mgmtocc sales construction production

// Re-assess multicollinearity
estat ic

// Scatter plots to visualize relationships
twoway scatter medinc mgmtocc
twoway scatter medinc sales
twoway scatter medinc construction
twoway scatter medinc production
twoway scatter medinc unemprate
twoway scatter medinc forborn
twoway scatter medinc bachelors

// Generate and regress lnmedinc on transformed variables
gen lnmedinc = ln(sales)
reg lnmedinc bachelors unemprate forborn age65over mgmtocc lnsales construction production
estat ic

gen lnunemprate = ln(unemprate)
reg lnmedinc bachelors lnunemprate forborn age65over mgmtocc lnsales construction production
estat ic

gen lnforborn = ln(forborn)
reg lnmedinc bachelors lnunemprate lnforborn age65over mgmtocc lnsales construction production
estat ic

reg lnmedinc bachelors unemprate lnforborn age65over mgmtocc lnsales construction production
estat ic

reg lnmedinc bachelors unemprate lnforborn age65over mgmtocc sales construction production
estat ic

gen lnconstruction = ln(construction)
reg lnmedinc bachelors unemprate forborn age65over mgmtocc lnsales lnconstruction production
estat ic

reg lnmedinc bachelors unemprate forborn age65over mgmtocc sales lnconstruction production
estat ic

gen lnproduction = ln(production)
reg lnmedinc bachelors unemprate forborn age65over mgmtocc sales construction lnproduction
estat ic

reg lnmedinc bachelors unemprate forborn age65over mgmtocc lnsales construction lnproduction
estat ic

reg lnmedinc bachelors unemprate forborn age65over mgmtocc lnsales lnconstruction lnproduction
estat ic

reg lnmedinc bachelors lnunemprate forborn age65over mgmtocc lnsales construction lnproduction
estat ic

// Predict residuals and plot against original and transformed medinc to check for heteroskedasticity
predict e, residual
twoway scatter e medinc
twoway scatter e lnmedinc

// Additional model refinement and diagnostics
// Check for heteroskedasticity using the White test
imtest, white

// Polynomial regression for potential non-linear relationships
gen unemprate_sq = unemprate^2
reg medinc unemprate unemprate_sq

// Refine models focusing on subsets and transformations
reg lnmedinc bachelors unemprate forborn age65over mgmtocc lnsales construction lnproduction
order lnmedinc medinc bachelors bachelors unemprate unemprate_sq forborn age65over white male mgmtocc lnsales sales construction production

// Further iterations and model comparisons
reg lnmedinc bachelors grad unemprate forborn age65over white male mgmtocc lnsales construction lnproduction
estat ic

reg lnmedinc bachelors grad unemprate forborn age65over mgmtocc lnsales construction lnproduction
estat ic

reg lnmedinc bachelors grad unemprate forborn age65over white male mgmtocc lnsales construction lnproduction

// Include interaction effects
reg lnmedinc bachelors grad unemprate unemprate_sq forborn age65over white male mgmtocc lnsales construction lnproduction
estat ic

reg lnmedinc bachelors grad unemprate forborn age65over white male mgmtocc lnsales construction lnproduction
estat ic

// Final model checks and diagnostics
reg lnmedinc bachelors unemprate unemprate_sq forborn age65over white male mgmtocc lnsales construction lnproduction
reg lnmedinc bachelors grad unemprate unemprate_sq forborn age65over white male mgmtocc lnsales construction lnproduction
estat vif

// Additional diagnostics and robustness checks
twoway scatter e lnmedinc
reg lnmedinc grad unemprate unemprate_sq forborn age65over white male mgmtocc lnsales construction lnproduction
reg lnmedinc bachelors grad unemprate unemprate_sq forborn age65over white male mgmtocc lnsales construction lnproduction
imtest, white

// Robust regression for outlier robustness
reg lnmedinc grad unemprate unemprate_sq forborn age65over mgmtocc lnsales construction lnproduction, robust
reg lnmedinc bachelors unemprate unemprate_sq forborn age65over white male mgmtocc lnsales construction lnproduction, robust
estat ic

// Final adjustments and variable transformations
drop lnunemprate lnforborn lnconstruction

// Final model specification and ordering
order lnmedinc medinc bachelors grad unemprate unemprate_sq forborn age65over white male mgmtocc lnsales sales construction lnproduction production

// Summary statistics after final adjustments
summarize
