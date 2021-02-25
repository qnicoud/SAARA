# Nettoyer l'environement (être sur qu'il n'a plus de données dans R qui pourrait générer un conflit)
rm(list = ls())


# Charger dans R les données du package "SAARA"
source(file = "C:/Users/quent/Documents/GitHub/SAARA/rScript.R")


# Défini une liste de packages à installer sur la machine
list_of_required_pckg <- data.frame(pckg = c("readxl", "xlsx", "car", "testit", "RInside"),
                                    version = c("1.3.1", "0.6.1", "3.0-2", "0.9", "0.2.15")) ## needs tidyr, plyr and multcompView also


# pooling_ref <- list(Mt = c(1:6), Ms = c(7:11))


# Défini le chemin vers le dossier dans lequel se trouvent les données
pathToExpeFolder <- "C:/Users/quent/Desktop/data_ARA"

# Initialise R pour qu'il puisse effectuer toute l'analyse qui suit
init_env(list_of_required_pckg, pathToExpeFolder)

# Définir la localisation du tableau modèle, contenant la correspondance entre noms d'échantillons et annotation dans la machine
pathToTemplate <- paste(getwd(), "/temp.xlsx", sep = "")

# Récolter les données
extract <- data_extraction(getwd(), 1.7)

# Utiliser les fichier modèle (temp.xlsx) pour générer le tableau modèles dans R
temp <- template_gen(getwd(), pathToTemplate)




pooling_ref <- list(data = seq(1,2))
# 
pool_all <- pool_expe(extract, pooling_ref, temp)

# ##Temp / spe to yejara expe
# clean_table <- function(pool_extract) {
#     mtNi <- pool_extract[[2]][seq(from = 112, to = 120, by = 2),]
#     pool_extract[[1]] <- rbind(pool_extract[[1]], mtNi)
#     pool_extract[[2]] <- pool_extract[[2]][-seq(from = 112, to = 120, by = 2),]
# 
#     pool_extract
# }
# pool_all <- lapply(pool_all, clean_table)
# 
# res <- data_formating_and_calc(pool_all[[1]], pool_all[[2]])




# Formate les data et les formate en utilisant le modèle
res <- data_formating_and_calc(extract, temp)

res <- data_formating_and_calc(pool_all[[1]], pool_all[[2]])

write_data(res, "C:/Users/quent/Desktop/data_ARA/results.xlsx")

result <- res

a <- check_normality(result)
normality_results <- a
b <- check_var_h(result)
var_h_results <- b

mean_test_res <- check_means(result, normality_results, var_h_results)



result <- assign_facet_classes(result, "reference.xlsx")

label_ok <- gen_stat_lab(result, mean_test_res)

saara_plots(result, "bmp", y_axis_title = "Nitrogen fixation (nmol(C2H4)/h/plant)",
            y_axis_text_size = 20, box_width = 1.5, stats = label_ok, colors = c("black", "#4CB4BE", "#93aa00", "grey", "#619cff", "white", "#FFBA00", "#FF9223", "#FF5123"), facet = TRUE, graph_width = 1100, graph_height = 500, graph_unit = 'px', jpg_quality = 75, tiff_pdf_compression = 'none')


# plots <- list( Mt =
#     ggplot(result$Mt, aes(x = reorder_within(condition_name, ord, class), y = nmolC2H4_H_plant, fill = condition_name)) +
#     geom_boxplot(size = 1.5) +
#     facet_grid(~class, scales = "free") +
#     scale_x_reordered() +
#     scale_fill_manual(values = c("black", "#4CB4BE", "#93aa00", "grey", "#619cff", "white", "#FFBA00", "#FF9223", "#FF5123")) +
#     labs(x = "", y = "Nitrogen fixation (nmol(C2H4)/h/plant)") +
#     theme(legend.position = "none",
#           strip.text = element_text(size = 24, face="bold"),
#           axis.title.y = element_text(size = 22),
#           axis.text.y = element_text(size = 20)) +
#     geom_text(data = label_ok$Mt, aes(x = reorder_within(condition_name, ord, class), y = V1, label = labels),size=8)
#              , Ms =
#     ggplot(result$Ms, aes(x = reorder_within(condition_name, ord, class), y = nmolC2H4_H_plant, fill = condition_name)) +
#     geom_boxplot(size = 1.5) +
#     facet_grid(~class, scales = "free") +
#     scale_x_reordered() +
#     scale_fill_manual(values = c("black", "#4CB4BE", "#93aa00", "grey", "#619cff", "white", "#FFBA00", "#FF9223", "#FF5123")) +
#     labs(x = "", y = "Nitrogen fixation (nmol(C2H4)/h/plant)") +
#     theme(legend.position = "none",
#           strip.text = element_text(size = 24, face="bold"),
#           axis.title.y = element_text(size = 22),
#           axis.text.y = element_text(size = 20)) +
#     geom_text(data = label_ok$Ms, aes(x = reorder_within(condition_name, ord, class), y = V1, label = labels),size=8)
#     )
#
# save_bmp(plots, awidth = 1100, aheight = 500)