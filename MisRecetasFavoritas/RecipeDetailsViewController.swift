import UIKit

class RecipeDetailsViewController: UIViewController {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var instructionsTextView: UITextView!
    @IBOutlet weak var prepTimeLabel: UILabel!
    @IBOutlet weak var cookTimeLabel: UILabel!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!

    var recipe: Recipe?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        populateData()
    }

    // MARK: - Appearance

    private func configureAppearance() {
        let warmCream = UIColor(red: 1.0, green: 0.973, blue: 0.941, alpha: 1.0)
        let terracotta = UIColor(red: 0.757, green: 0.267, blue: 0.055, alpha: 1.0)
        let darkText = UIColor(red: 0.15, green: 0.12, blue: 0.10, alpha: 1.0)

        view.backgroundColor = warmCream

        // Navigation title
        title = recipe?.name
        navigationItem.largeTitleDisplayMode = .never

        // Image styling
        recipeImageView.contentMode = .scaleAspectFill
        recipeImageView.clipsToBounds = true

        // Name label
        nameLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        nameLabel.textColor = darkText

        // Metadata labels styling
        let metadataLabels = [prepTimeLabel, cookTimeLabel, servingsLabel, difficultyLabel]
        for label in metadataLabels {
            label?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            label?.textColor = terracotta
            label?.textAlignment = .center
            label?.layer.cornerRadius = 8
            label?.layer.masksToBounds = true
            label?.backgroundColor = terracotta.withAlphaComponent(0.1)
        }

        // TextViews — make them look like clean, padded labels
        configureTextView(ingredientsTextView)
        configureTextView(instructionsTextView)
    }

    private func configureTextView(_ textView: UITextView) {
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        textView.textContainerInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        textView.textContainer.lineFragmentPadding = 0
        textView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textView.textColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.0)
    }

    // MARK: - Data Population

    private func populateData() {
        guard let recipe = recipe else { return }

        recipeImageView.image = UIImage(named: recipe.image)
        nameLabel.text = recipe.name

        // Format ingredients with bullet points
        let ingredientsParagraphStyle = NSMutableParagraphStyle()
        ingredientsParagraphStyle.lineSpacing = 6
        ingredientsParagraphStyle.paragraphSpacing = 2

        let ingredientsText = recipe.ingredients.map { "•  \($0)" }.joined(separator: "\n")
        let ingredientsAttr = NSAttributedString(
            string: ingredientsText,
            attributes: [
                .font: UIFont.systemFont(ofSize: 16, weight: .regular),
                .foregroundColor: UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.0),
                .paragraphStyle: ingredientsParagraphStyle
            ]
        )
        ingredientsTextView.attributedText = ingredientsAttr

        // Format instructions with numbered steps
        let instructionsParagraphStyle = NSMutableParagraphStyle()
        instructionsParagraphStyle.lineSpacing = 4
        instructionsParagraphStyle.paragraphSpacing = 10

        let instructionsText = recipe.instructions.enumerated().map {
            "Paso \($0.offset + 1):  \($0.element)"
        }.joined(separator: "\n")

        let instructionsAttr = NSAttributedString(
            string: instructionsText,
            attributes: [
                .font: UIFont.systemFont(ofSize: 16, weight: .regular),
                .foregroundColor: UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.0),
                .paragraphStyle: instructionsParagraphStyle
            ]
        )
        instructionsTextView.attributedText = instructionsAttr

        // Metadata
        prepTimeLabel.text = "  🕐 \(recipe.prepTime)  "
        cookTimeLabel.text = "  🔥 \(recipe.cookTime)  "
        servingsLabel.text = "  🍽 \(recipe.servings)  "
        difficultyLabel.text = "  👨‍🍳 \(recipe.difficulty)  "
    }
}
