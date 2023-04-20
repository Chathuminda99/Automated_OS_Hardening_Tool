import colorama
from colorama import Fore, Back, Style

# Initialize colorama
colorama.init()

# Print colored text
print(Fore.RED + "Red text" + Style.RESET_ALL)
print(Back.GREEN + "Green background" + Style.RESET_ALL)
print(Fore.YELLOW + Back.BLUE + "Yellow text on blue background" + Style.RESET_ALL)

# Print colored text using ANSI escape codes
print("\033[31mRed text\033[0m")
print("\033[42mGreen background\033[0m")
print("\033[33m\033[44mYellow text on blue background\033[0m")
