#
# Hangman game
#

# -----------------------------------
# Created by Prasanna Prakash

import random
import string

WORDLIST_FILENAME = "words.txt"

def loadWords():
    """
    Returns a list of valid words. Words are strings of lowercase letters.
    
    Depending on the size of the word list, this function may
    take a while to finish.
    """
    print "Loading word list from file..."
    # inFile: file
    inFile = open(WORDLIST_FILENAME, 'r')
    # line: string
    line = inFile.readlines(100000)
    # wordlist: list of strings
    wordlist = []
    for i in range(len(line)):
        wordlist=line[i]
    
    print "  ", len(wordlist), "words loaded."
    return wordlist

def chooseWord(wordlist):
    """
    wordlist (list): list of words (strings)

    Returns a word from wordlist at random
    """
    return random.choice(wordlist)

# end of helper code
# -----------------------------------

# Load the list of words into the variable wordlist
# so that it can be accessed from anywhere in the program
wordlist = loadWords()

def isWordGuessed(secretWord, lettersGuessed):
    '''
    secretWord: string, the word the user is guessing
    lettersGuessed: list, what letters have been guessed so far
    returns: boolean, True if all the letters of secretWord are in lettersGuessed;
      False otherwise
    '''
    flag=0
    for c in secretWord:
        
        for i in lettersGuessed:
            
            if i==c:
                flag=1
                break
        
        if flag==0:
            return False
        flag=0
    
    return True


def getGuessedWord(secretWord, lettersGuessed):
    '''
    secretWord: string, the word the user is guessing
    lettersGuessed: list, what letters have been guessed so far
    returns: string, comprised of letters and underscores that represents
      what letters in secretWord have been guessed so far.
    '''
    flag=0
    s=""
    
    for c in secretWord:
        
        for i in lettersGuessed:
            
            if i==c:
                s=s+c
                flag=1
                break
                
        if flag==0:
            s=s+"_ "
            
        flag=0
        
    return s


def getAvailableLetters(lettersGuessed):
    '''
    lettersGuessed: list, what letters have been guessed so far
    returns: string, comprised of letters that represents what letters have not
      yet been guessed.
    '''
    flag=0
    s=string.ascii_lowercase
    s1=''
    
    for i in s:
        
        for j in lettersGuessed:
            
            if i==j:
                flag=1
                break
                
        if flag==0:
            s1=s1+i
            
        flag=0
        
    return s1
    

def hangman(secretWord):
    '''
    secretWord: string, the secret word to guess.

    Starts up an interactive game of Hangman.

    * At the start of the game, let the user know how many 
      letters the secretWord contains.

    * Ask the user to supply one guess (i.e. letter) per round.

    * The user should receive feedback immediately after each guess 
      about whether their guess appears in the computers word.

    * After each round, you should also display to the user the 
      partially guessed word so far, as well as letters that the 
      user has not yet guessed.

    Follows the other limitations detailed in the problem write-up.
    '''
    s=[]
    s2=getGuessedWord(secretWord,[])
    s3=getGuessedWord(secretWord,[])
    flag=0
   
    i=8
    
    print "Welcome to game Hangman!"
    print "I am thinking of a word that is " +str(len(secretWord))+ " letters long."
    print "-----------"
    
    while (i!=0):
        
        flag=0
        print "You have " + str(i) + " guesses left "
        print "Available letters: " + getAvailableLetters(s)
        inp=raw_input("Please guess a letter: ")
        inpl=inp.lower()
        
        for j in s:
            if j==inpl:
                flag=1
                break
        
        if flag==1:
            print "Oops! You've already guessed that letter: " + s3
            print "-----------"
            continue
            
        s.append(inpl)
        
        s2=getGuessedWord(secretWord, s)
        
        if s2==s3:
            print "Oops! That letter is not in my word: " + s2
            print "-----------"
            i=i-1
        else:
            print "Good guess: " + s2
            print "-----------"
            
        if isWordGuessed(secretWord,s):
            print "Congratulations, You won!"
            break
            
        if s2==s3 and i==0:
            print "Sorry, you ran out of guesses. The word was " + secretWord + '.'
            break
            
        s3=s2


secretWord = chooseWord(wordlist).lower()
print hangman(secretWord)
