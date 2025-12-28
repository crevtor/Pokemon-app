// ignore_for_file: constant_identifier_names
const String appName = "Cercu";


//Keys
const stateDB = "cercuStateDB";
const appSecret = 'secret';
const storageKey = 'storage_key';
const userKey = 'user';
const pinHiveState = "pin_state";

//Currencies

// API Urls

const nigeriaPhoneLength = 11;
const unitedStatesPhoneLength = 10;
const cameroonPhoneLength = 9;
const senegalPhoneLength = 8;
const ugandaPhoneLength = 12;
const emailOtpLength = 4;
const passcodeLength = 4;
const bvnLength = 11;
const accountNumberLength = 10;
const accountPasscodeLength = 4;
const otpRetryInterval = 59;


//Fonts
const outfit = 'Outfit';
const outfit_black = 'Outfit-black';


//Info Messages

const biometricsDefaultReason = 'Please authenticate to continue';

const errorMessage =
    "Sorry about this, Something's wrong but we are fixing it.";
const networkError =
    'No internet connection, Kindly check your internet to have a seamless experience.';

// const passwordFormat = 'Minimum 8 characters with at least 1 uppercase, 1 lowercase, 1 number and 1 special character';

// const passwordLimitFormat = 'Password should be made up of alphabets and numbers of 8 characters at least';

// const passwordRegEx = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$#!%*?&])[A-Za-z\d@$#!%*?&]{8,}$';

const passwordRegEx = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$';

const passwordLimitFormat = 'Password must be at least 8 characters';

const passwordFormat = 'Minimum 8 characters, with at least 1 uppercase, 1 lowercase, and 1 number (0-9)';


// const passwordRegEx = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!#%*?&])[A-Za-z\d@$!#%*?&]{8,}$';

const emailRegex = r"^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$";

const emojiRegex = r'[\p{So}\p{Cn}\p{Cs}]';

const phoneRegex = r"^\+?[0-9]{7,15}$";

const privacyPolicyError = 'Kindly accept the privacy policy to continue';
const passwordNotAMatchError = 'Passwords do not match';
const passwordRequiredError = 'Password is required';
const amountRequiredError = 'Amount is required';
const passwordError = 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character';
const passwordReset = 'Your account has been updated, an email would be sent to your registered email address.';


// Signup magiv strings
const getStartedTitle = "Let’s get you started";
const getStartedSubTitle = "Create an account to explore about our app";

const verifyOtpTitle = "Let’s get you started";
const verifyOtpSubTitle = "Enter the 6-digit verification code sent to your email ";

const comingSoonText = 'Coming soon 🚀';


String loginThroughEmail = "LOGIN_THROUGH_EMAIL";
String loginThroughGoogle = "LOGIN_THROUGH_GOOGLE";
String loginThroughApple = "LOGIN_THROUGH_APPLE";

String signUpThroughEmail = "SIGNUP_THROUGH_EMAIL";
String signUpThroughGoogle = "SIGNUP_THROUGH_GOOGLE";
String signUpThroughApple = "SIGNUP_THROUGH_APPLE";
