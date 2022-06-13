library(boot)
dat <- melanoma
dat$sex <- as.factor(dat$sex) # change variable sex to factor, facultative: with 0 1 not necessary
fit <- glm(ulcer ~sex*thickness, family = "binomial", data=dat)
anova(fit)

car::Anova(fit, type = "III")


Mc-Faddens Pseudo-R² 


logLik(fit)


library(DescTools)

fit <- glm(ulcer ~sex + thickness, family = "binomial", data=dat)
R2a = PseudoR2(fit, which = "McFadden")
R2a

fit <- glm(ulcer ~sex*thickness, family = "binomial", data=dat)
R2b = PseudoR2(fit, which = "McFadden")
R2b

R2b -R2a