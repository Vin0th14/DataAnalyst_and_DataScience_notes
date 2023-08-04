
def no_of_unique_words(string):
    list=[]
    c=0
    for s in string:
        if s not in list:
            c+=1
            list.append(s)
    return c
    
def hangman(secret_word):
    guess=6
    letters_guessed=[]
    total_score=0

    print("Welcome to game Hangman !!")
    print(f"I am thinking of a word that is {len(secret_word)} letters long .")
    print("_________________________________________")
    while True:
        
        if (guess==0 and is_word_guessed(secret_word,letters_guessed)==False)or is_word_guessed(secret_word,letters_guessed):
            if is_word_guessed(secret_word,letters_guessed):
                total_score=guess*no_of_unique_words(secret_word)
                print("Congratulations you won !!!")
                print("Your total score for the game is :",total_score)
            elif (guess==0 and is_word_guessed(secret_word,letters_guessed)==False):
                print("Sorry You ran out of guesses .The word was ",secret_word)
            
        else:
            available_letter=get_available_letters(letters_guessed)
            print(f"You have {guess} guesses remaining ")
            print("Available letters ",available_letter)
            letter_guessed=input("Please guess a letter :")

            if (letter_guessed.isalpha==False):
                print("That is not a valid letter ")
                print("______________________________________________")
            elif (letter_guessed in letters_guessed):
                print("You already guessed this letter ")
                print("______________________________________________")
            
            letter_guessed=letter_guessed.lower()
            letters_guessed.append(letter_guessed)
            
            if letter_guessed in secret_word:
                print(f"Good guess {get_guessed_word(secret_word,letters_guessed)}")
            elif letter_guessed in ['a','e','i','o','u']:
                print(f'Oops that letter is not in word {get_guessed_word(secret_word,letters_guessed)}')
                guess-=2
            else:
                print(f'Oops that letter is not in word {get_guessed_word(secret_word,letters_guessed)}')
                guess-=1
            print("______________________________________________")
            continue
        break


def get_available_letters(letters_guessed):
    
    available_letters=string.ascii_lowercase
    for i in letters_guessed:
        available_letters=available_letters.replace(i,"")
    return available_letters

# importing modules needed for the project
import random
import string

def get_guessed_word(secret_word, letters_guessed):
    for i in secret_word:
        if i not in letters_guessed:
            secret_word=secret_word.replace(i,"_ ")
    return secret_word

    
def is_word_guessed(secret_word, letters_guessed):
    
    count=0
    lenght=len(secret_word)
    for i in secret_word:
        if i in letters_guessed:
            count+=1
    if count==lenght:
        return True
    else:
        return False

    
words = ['army', 'beautiful', 'became', 'if', 'actually', 'beside', 'between','come','eye','five','fur','imposter', 'problem' ,'revenge' ,'few' ,'circle' ,'district','trade','quota','stop','depressed','disorder','dentist']

#choose a random word from list using random.choice() function
random_word = random.choice(words)

#check you function
hangman(random_word)
    

