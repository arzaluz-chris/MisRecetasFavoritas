import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var recipiesArray: [Recipe] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setupRecipes()
        configureAppearance()

        tableView.dataSource = self
        tableView.delegate = self
        // Remove empty cells separators
        tableView.tableFooterView = UIView()
    }

    // MARK: - Appearance

    private func configureAppearance() {
        let warmCream = UIColor(red: 1.0, green: 0.973, blue: 0.941, alpha: 1.0)

        view.backgroundColor = warmCream
        tableView.backgroundColor = warmCream
        tableView.separatorStyle = .none

        // Large titles
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }

    // MARK: - Recipe Data

    private func setupRecipes() {
        recipiesArray = [
            Recipe(
                image: "albondingas_en_chipotle",
                name: "Albóndigas en Chipotle",
                shortDescription: "Jugosas albóndigas de res bañadas en una salsa ahumada de chile chipotle.",
                ingredients: [
                    "500 g de carne molida de res",
                    "¼ de taza de pan molido",
                    "1 huevo",
                    "¼ de cebolla finamente picada",
                    "1 diente de ajo picado",
                    "Sal y pimienta al gusto",
                    "4 jitomates maduros",
                    "3 chiles chipotles en adobo",
                    "¼ de cebolla (para la salsa)",
                    "1 diente de ajo (para la salsa)",
                    "1 taza de caldo de pollo",
                    "1 cucharada de aceite vegetal"
                ],
                instructions: [
                    "Mezcla la carne molida con el pan molido, huevo, cebolla picada, ajo, sal y pimienta hasta integrar bien.",
                    "Forma bolitas medianas con las manos húmedas y resérvalas.",
                    "Licúa los jitomates con los chipotles, cebolla, ajo y el caldo de pollo hasta obtener una salsa tersa.",
                    "Calienta el aceite en una cacerola y vierte la salsa. Deja hervir a fuego medio.",
                    "Agrega las albóndigas con cuidado a la salsa hirviendo.",
                    "Baja el fuego, tapa y cocina durante 25-30 minutos hasta que las albóndigas estén completamente cocidas.",
                    "Rectifica la sazón y sirve caliente acompañadas de arroz blanco."
                ],
                prepTime: "20 min",
                cookTime: "35 min",
                servings: "4 porc.",
                difficulty: "Fácil"
            ),
            Recipe(
                image: "chilaquiles_verdes_de_pollo",
                name: "Chilaquiles Verdes",
                shortDescription: "Totopos crujientes bañados en salsa verde con pollo deshebrado, crema y queso.",
                ingredients: [
                    "12 tortillas de maíz cortadas en triángulos",
                    "500 g de tomate verde",
                    "2 chiles serranos",
                    "¼ de cebolla",
                    "1 diente de ajo",
                    "Un manojo de cilantro fresco",
                    "2 tazas de pollo cocido y deshebrado",
                    "Aceite vegetal para freír",
                    "Crema ácida al gusto",
                    "Queso fresco desmoronado",
                    "Cebolla en rodajas para decorar",
                    "Sal al gusto"
                ],
                instructions: [
                    "Fríe los triángulos de tortilla en aceite caliente hasta que estén dorados y crujientes. Escúrrelos sobre papel absorbente.",
                    "Hierve los tomates verdes y los chiles serranos durante 8 minutos hasta que cambien de color.",
                    "Licúa los tomates y chiles cocidos con la cebolla, el ajo, el cilantro y un poco del agua de cocción.",
                    "Vierte la salsa en una sartén amplia y cocínala a fuego medio durante 5 minutos.",
                    "Agrega los totopos a la salsa y mezcla con cuidado para que se bañen uniformemente.",
                    "Sirve de inmediato con el pollo deshebrado encima, crema, queso fresco y rodajas de cebolla."
                ],
                prepTime: "15 min",
                cookTime: "25 min",
                servings: "4 porc.",
                difficulty: "Fácil"
            ),
            Recipe(
                image: "chiles_en_nogada",
                name: "Chiles en Nogada",
                shortDescription: "Emblemático platillo poblano con picadillo de frutas y salsa cremosa de nuez.",
                ingredients: [
                    "6 chiles poblanos grandes",
                    "300 g de carne molida de res",
                    "200 g de carne molida de cerdo",
                    "1 manzana panochera picada en cubitos",
                    "1 pera picada en cubitos",
                    "1 durazno picado en cubitos",
                    "1 plátano macho maduro picado",
                    "¼ de taza de pasas",
                    "¼ de taza de almendras peladas y picadas",
                    "1 taza de nuez de Castilla",
                    "200 g de queso de cabra",
                    "¾ de taza de crema",
                    "½ taza de leche",
                    "Granos de granada para decorar",
                    "Perejil fresco picado",
                    "Sal y pimienta al gusto"
                ],
                instructions: [
                    "Asa los chiles directamente sobre la flama, colócalos en una bolsa de plástico y déjalos sudar 10 minutos. Pélalos con cuidado sin romperlos y hazles una abertura lateral para rellenar.",
                    "Sofríe la carne de res y cerdo con cebolla y ajo. Agrega las frutas picadas, pasas y almendras. Cocina a fuego medio durante 15 minutos hasta que las frutas estén suaves.",
                    "Sazona el picadillo con sal y pimienta. Deja enfriar ligeramente.",
                    "Rellena cada chile con el picadillo, cerrándolos con cuidado.",
                    "Para la nogada, licúa la nuez de Castilla (previamente remojada y pelada) con el queso de cabra, la crema y la leche hasta obtener una salsa cremosa y tersa.",
                    "Coloca los chiles rellenos en un platón, báñalos generosamente con la nogada y decora con granos de granada y perejil picado."
                ],
                prepTime: "45 min",
                cookTime: "40 min",
                servings: "6 porc.",
                difficulty: "Alta"
            ),
            Recipe(
                image: "enchiladas_suizas",
                name: "Enchiladas Suizas",
                shortDescription: "Enchiladas de pollo en salsa verde cremosa, gratinadas con queso manchego dorado.",
                ingredients: [
                    "12 tortillas de maíz",
                    "3 tazas de pollo cocido y deshebrado",
                    "500 g de tomate verde",
                    "2 chiles serranos",
                    "½ cebolla",
                    "1 diente de ajo",
                    "Un manojo de cilantro",
                    "1 taza de crema ácida",
                    "2 tazas de queso manchego rallado",
                    "Aceite vegetal",
                    "Sal al gusto"
                ],
                instructions: [
                    "Hierve los tomates verdes y los chiles serranos durante 8 minutos.",
                    "Licúa los tomates y chiles con la cebolla, el ajo, el cilantro y la crema ácida hasta obtener una salsa cremosa.",
                    "Pasa cada tortilla brevemente por aceite caliente para suavizarla.",
                    "Rellena cada tortilla con pollo deshebrado y enrolla. Colócalas en un refractario.",
                    "Baña todas las enchiladas con la salsa verde cremosa.",
                    "Cubre con abundante queso manchego rallado.",
                    "Hornea a 200°C durante 15-20 minutos o hasta que el queso esté dorado y burbujeante.",
                    "Sirve caliente decoradas con crema y rodajas de cebolla."
                ],
                prepTime: "20 min",
                cookTime: "30 min",
                servings: "4 porc.",
                difficulty: "Media"
            ),
            Recipe(
                image: "pollo_mole_poblano",
                name: "Pollo en Mole Poblano",
                shortDescription: "Piezas de pollo bañadas en el tradicional y complejo mole poblano con ajonjolí.",
                ingredients: [
                    "8 piezas de pollo (muslos y piernas)",
                    "250 g de pasta de mole poblano",
                    "3 tazas de caldo de pollo caliente",
                    "2 cucharadas de manteca o aceite",
                    "1 tablilla de chocolate de mesa",
                    "2 cucharadas de azúcar (ajustar al gusto)",
                    "Ajonjolí tostado para decorar",
                    "Sal al gusto",
                    "Arroz blanco para acompañar",
                    "Tortillas de maíz calientes"
                ],
                instructions: [
                    "Cuece las piezas de pollo en agua con sal, cebolla y ajo durante 35 minutos hasta que estén tiernas. Reserva el caldo.",
                    "En una olla grande, calienta la manteca o aceite a fuego medio.",
                    "Disuelve la pasta de mole en el caldo caliente poco a poco, removiendo constantemente para evitar grumos.",
                    "Vierte la mezcla en la olla con la manteca y cocina a fuego medio-bajo durante 20 minutos, moviendo frecuentemente para que no se pegue.",
                    "Agrega el chocolate y el azúcar. Continúa cocinando hasta que el mole espese y los sabores se integren.",
                    "Incorpora las piezas de pollo cocido y deja hervir a fuego bajo 10 minutos más.",
                    "Sirve las piezas de pollo bañadas en mole, espolvoreadas con ajonjolí tostado y acompañadas de arroz blanco."
                ],
                prepTime: "20 min",
                cookTime: "1 hr 10 min",
                servings: "6 porc.",
                difficulty: "Media"
            ),
            Recipe(
                image: "pozole",
                name: "Pozole Rojo",
                shortDescription: "Caldo tradicional con maíz cacahuazintle y carne de cerdo en chile guajillo.",
                ingredients: [
                    "1 kg de maíz pozolero precocido",
                    "800 g de carne de cerdo (maciza y espinazo)",
                    "1 cabeza de ajo",
                    "1 cebolla mediana",
                    "6 chiles guajillo desvenados",
                    "3 chiles ancho desvenados",
                    "Orégano seco al gusto",
                    "Rábanos en rodajas",
                    "Lechuga finamente rebanada",
                    "Cebolla picada",
                    "Limones partidos",
                    "Tostadas",
                    "Sal al gusto"
                ],
                instructions: [
                    "Cuece el maíz pozolero en abundante agua con la cabeza de ajo y media cebolla durante 1.5 horas o hasta que los granos revienten.",
                    "En otra olla, cuece la carne de cerdo con sal, cebolla y ajo hasta que esté suave (aproximadamente 45 minutos).",
                    "Remoja los chiles guajillo y ancho en agua caliente durante 15 minutos. Licúalos con un poco del agua de remojo y un diente de ajo.",
                    "Cuela la salsa de chile sobre el maíz cocido y mezcla bien.",
                    "Agrega la carne de cerdo deshebrada o en trozos al caldo con el maíz.",
                    "Deja hervir todo junto a fuego lento durante 30 minutos para que los sabores se integren. Sazona con sal.",
                    "Sirve en platos hondos con lechuga, rábanos, orégano, cebolla picada y un buen chorrito de limón. Acompaña con tostadas."
                ],
                prepTime: "30 min",
                cookTime: "2 horas",
                servings: "8 porc.",
                difficulty: "Media"
            ),
            Recipe(
                image: "tacos_cochinita_Pibil",
                name: "Tacos de Cochinita Pibil",
                shortDescription: "Suculenta carne de cerdo adobada en achiote y cítricos, deshebrada para tacos.",
                ingredients: [
                    "1 kg de carne de cerdo (pierna o espaldilla)",
                    "100 g de pasta de achiote",
                    "1 taza de jugo de naranja agria",
                    "3 cucharadas de jugo de limón",
                    "3 dientes de ajo",
                    "½ cucharadita de comino molido",
                    "½ cucharadita de pimienta negra",
                    "1 cucharadita de orégano seco",
                    "Hojas de plátano para envolver",
                    "1 cebolla morada en rodajas",
                    "1 chile habanero",
                    "Vinagre de manzana",
                    "Tortillas de maíz",
                    "Sal al gusto"
                ],
                instructions: [
                    "Disuelve la pasta de achiote en el jugo de naranja agria y limón. Agrega el ajo, comino, pimienta, orégano y sal. Mezcla bien para formar un adobo uniforme.",
                    "Marina la carne de cerdo con el adobo durante al menos 4 horas (idealmente toda la noche en refrigeración).",
                    "Pasa las hojas de plátano por la flama para suavizarlas. Envuelve la carne marinada en las hojas.",
                    "Coloca en un refractario cubierto con papel aluminio y hornea a 160°C durante 3 horas hasta que la carne se deshaga fácilmente.",
                    "Mientras tanto, prepara la cebolla encurtida: mezcla las rodajas de cebolla morada con vinagre, jugo de limón, orégano y una pizca de sal. Deja reposar al menos 30 minutos.",
                    "Deshebra la carne y mezcla con los jugos de cocción.",
                    "Sirve en tortillas de maíz calientes con cebolla morada encurtida y salsa de chile habanero al gusto."
                ],
                prepTime: "30 min + marinado",
                cookTime: "3 horas",
                servings: "6 porc.",
                difficulty: "Media"
            ),
            Recipe(
                image: "tacos_milanesa_de_pollo",
                name: "Tacos de Milanesa",
                shortDescription: "Crujiente pechuga de pollo empanizada servida en tortillas con aguacate fresco.",
                ingredients: [
                    "4 pechugas de pollo aplanadas delgadas",
                    "2 huevos batidos",
                    "1 taza de pan molido",
                    "½ taza de harina de trigo",
                    "Aceite vegetal para freír",
                    "12 tortillas de maíz",
                    "2 aguacates maduros rebanados",
                    "Salsa verde o roja al gusto",
                    "Lechuga finamente rebanada",
                    "Jitomate en rodajas",
                    "Limón",
                    "Sal y pimienta al gusto"
                ],
                instructions: [
                    "Sazona las pechugas aplanadas con sal y pimienta por ambos lados.",
                    "Pasa cada pechuga primero por harina, luego por huevo batido y finalmente por pan molido, presionando para que se adhiera bien.",
                    "Calienta abundante aceite en una sartén a fuego medio-alto.",
                    "Fríe cada milanesa durante 3-4 minutos por lado hasta que estén doradas y crujientes. Escurre sobre papel absorbente.",
                    "Corta las milanesas en tiras gruesas.",
                    "Calienta las tortillas en un comal.",
                    "Arma los tacos con las tiras de milanesa, lechuga, jitomate, rebanadas de aguacate y un chorrito de limón. Acompaña con tu salsa favorita."
                ],
                prepTime: "20 min",
                cookTime: "15 min",
                servings: "4 porc.",
                difficulty: "Fácil"
            ),
            Recipe(
                image: "tostadas_de_salpicon",
                name: "Tostadas de Salpicón",
                shortDescription: "Ensalada fresca de carne deshebrada con vinagreta de orégano sobre tostada crujiente.",
                ingredients: [
                    "500 g de carne de res (falda o diezmillo)",
                    "1 taza de lechuga finamente rebanada",
                    "2 jitomates picados en cubos",
                    "½ cebolla morada en rodajas finas",
                    "2 aguacates maduros en rebanadas",
                    "¼ de taza de cilantro fresco picado",
                    "3 cucharadas de aceite de oliva extra virgen",
                    "2 cucharadas de vinagre de manzana",
                    "1 cucharadita de orégano seco",
                    "Tostadas de maíz",
                    "Sal y pimienta al gusto"
                ],
                instructions: [
                    "Cuece la carne de res en agua con sal, cebolla, ajo y hierbas de olor durante 1.5 horas hasta que esté muy suave.",
                    "Deja enfriar la carne y deshébrala finamente.",
                    "En un tazón grande, mezcla la carne deshebrada con la lechuga, jitomate, cebolla morada y cilantro.",
                    "Prepara la vinagreta mezclando el aceite de oliva, vinagre de manzana, orégano, sal y pimienta.",
                    "Vierte la vinagreta sobre el salpicón y mezcla bien para que todo se impregne.",
                    "Sirve generosas porciones sobre las tostadas crujientes y decora con rebanadas de aguacate."
                ],
                prepTime: "20 min",
                cookTime: "1.5 horas",
                servings: "6 porc.",
                difficulty: "Fácil"
            ),
            Recipe(
                image: "tostadas_tinga_pollo",
                name: "Tostadas de Tinga",
                shortDescription: "Pollo deshebrado en salsa de jitomate y chipotle ahumado, servido sobre tostadas.",
                ingredients: [
                    "3 pechugas de pollo cocidas y deshebradas",
                    "1 cebolla grande en julianas",
                    "4 jitomates maduros",
                    "3 chiles chipotles en adobo",
                    "2 dientes de ajo",
                    "2 cucharadas de aceite vegetal",
                    "Tostadas de maíz",
                    "Crema ácida",
                    "Queso fresco desmoronado",
                    "Lechuga finamente rebanada",
                    "Aguacate en rebanadas",
                    "Sal al gusto"
                ],
                instructions: [
                    "Sofríe la cebolla en julianas con aceite a fuego medio hasta que esté transparente y ligeramente dorada.",
                    "Licúa los jitomates con los chiles chipotles y el ajo hasta obtener una salsa homogénea.",
                    "Vierte la salsa sobre la cebolla y cocina a fuego medio durante 8 minutos.",
                    "Agrega el pollo deshebrado a la salsa y mezcla bien. Cocina a fuego lento durante 10 minutos hasta que espese.",
                    "Sazona con sal al gusto.",
                    "Para servir, unta una capa de crema sobre cada tostada, coloca una base de lechuga, agrega una porción generosa de tinga y decora con queso fresco y rebanadas de aguacate."
                ],
                prepTime: "15 min",
                cookTime: "25 min",
                servings: "6 porc.",
                difficulty: "Fácil"
            )
        ]
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetails",
           let destinationVC = segue.destination as? RecipeDetailsViewController,
           let recipe = sender as? Recipe {
            destinationVC.recipe = recipe
        }
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipiesArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }

        let recipe = recipiesArray[indexPath.row]
        cell.nameLabel.text = recipe.name
        cell.descriptionLabel.text = recipe.shortDescription
        cell.recipeImageView.image = UIImage(named: recipe.image)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedRecipe = recipiesArray[indexPath.row]
        performSegue(withIdentifier: "showRecipeDetails", sender: selectedRecipe)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    // Cell appear animation
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(translationX: 0, y: 20)
        UIView.animate(
            withDuration: 0.4,
            delay: 0.03 * Double(indexPath.row),
            usingSpringWithDamping: 0.85,
            initialSpringVelocity: 0.5,
            options: [.curveEaseOut]
        ) {
            cell.alpha = 1
            cell.transform = .identity
        }
    }
}
