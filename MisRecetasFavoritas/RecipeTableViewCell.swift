import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    // MARK: - Appearance

    private func configureAppearance() {
        // Cell background
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none

        // Image styling — rounded corners with subtle shadow
        recipeImageView.layer.cornerRadius = 14
        recipeImageView.clipsToBounds = true
        recipeImageView.contentMode = .scaleAspectFill

        // Name label styling
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        nameLabel.textColor = UIColor(red: 0.15, green: 0.12, blue: 0.10, alpha: 1.0)

        // Description label styling
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = UIColor.secondaryLabel
        descriptionLabel.numberOfLines = 2
    }

    // MARK: - Touch Animations

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animatePress(pressed: true)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animatePress(pressed: false)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        animatePress(pressed: false)
    }

    private func animatePress(pressed: Bool) {
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0.5,
            options: [.allowUserInteraction, .curveEaseInOut]
        ) {
            let scale: CGFloat = pressed ? 0.97 : 1.0
            self.contentView.transform = CGAffineTransform(scaleX: scale, y: scale)
            self.contentView.alpha = pressed ? 0.85 : 1.0
        }
    }
}
