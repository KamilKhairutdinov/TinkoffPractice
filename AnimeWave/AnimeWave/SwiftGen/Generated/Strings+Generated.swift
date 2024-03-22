// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  internal enum Alerts {
    internal enum Action {
      /// Try again
      internal static let alertActionTryAgain = Strings.tr("Localizable", "alerts.action.alertActionTryAgain", fallback: "Try again")
    }
    internal enum Messages {
      /// Incorrect login or password
      internal static let signInErrorAlert = Strings.tr("Localizable", "alerts.messages.signInErrorAlert", fallback: "Incorrect login or password")
    }
    internal enum Titles {
      /// Error
      internal static let errorAlertTitle = Strings.tr("Localizable", "alerts.titles.errorAlertTitle", fallback: "Error")
    }
  }
  internal enum Buttons {
    /// Go next
    internal static let next = Strings.tr("Localizable", "buttons.next", fallback: "Go next")
    /// Select photo
    internal static let pickImage = Strings.tr("Localizable", "buttons.pickImage", fallback: "Select photo")
    /// Sign in
    internal static let signIn = Strings.tr("Localizable", "buttons.signIn", fallback: "Sign in")
    /// Sign Up
    internal static let signUp = Strings.tr("Localizable", "buttons.signUp", fallback: "Sign Up")
  }
  internal enum Labels {
    /// Fill email field
    internal static let emptyEmailField = Strings.tr("Localizable", "labels.EmptyEmailField", fallback: "Fill email field")
    /// Fill password field
    internal static let emptyPasswordField = Strings.tr("Localizable", "labels.EmptyPasswordField", fallback: "Fill password field")
    /// Complete your profile
    internal static let fillProfileLabel = Strings.tr("Localizable", "labels.fillProfileLabel", fallback: "Complete your profile")
    /// Invalid mail format
    internal static let incorrectEmail = Strings.tr("Localizable", "labels.IncorrectEmail", fallback: "Invalid mail format")
    /// Password length must be longer than 6 characters
    internal static let incorrectPasswordLenght = Strings.tr("Localizable", "labels.IncorrectPasswordLenght", fallback: "Password length must be longer than 6 characters")
    /// Passwords don't match
    internal static let passwordsDontMatch = Strings.tr("Localizable", "labels.PasswordsDontMatch", fallback: "Passwords don't match")
    /// Fill all fields
    internal static let signInValidationError = Strings.tr("Localizable", "labels.signInValidationError", fallback: "Fill all fields")
  }
  internal enum TextFields {
    ///  Email
    internal static let emailPlaceholder = Strings.tr("Localizable", "textFields.emailPlaceholder", fallback: " Email")
    ///  Login
    internal static let loginPlaceholder = Strings.tr("Localizable", "textFields.loginPlaceholder", fallback: " Login")
    ///  Password confirmation
    internal static let passwordConfirmationPlaceholder = Strings.tr("Localizable", "textFields.passwordConfirmationPlaceholder", fallback: " Password confirmation")
    ///  Password
    internal static let passwordPlaceholder = Strings.tr("Localizable", "textFields.passwordPlaceholder", fallback: " Password")
  }
  internal enum Titles {
    /// Anime
    internal static let anime = Strings.tr("Localizable", "titles.anime", fallback: "Anime")
    /// Calendar
    internal static let calendar = Strings.tr("Localizable", "titles.calendar", fallback: "Calendar")
    /// Profile
    internal static let profile = Strings.tr("Localizable", "titles.profile", fallback: "Profile")
    /// Search
    internal static let search = Strings.tr("Localizable", "titles.search", fallback: "Search")
    /// Login
    internal static let signIn = Strings.tr("Localizable", "titles.signIn", fallback: "Login")
    /// Registration
    internal static let signUp = Strings.tr("Localizable", "titles.signUp", fallback: "Registration")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
