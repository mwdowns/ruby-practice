class Grader
    
    # Initiallizes the variables that that a new object of this class
    # uses, an answer_key and grades - grades set to nil.
    def initialize(answer_key, grades: nil)
    
        @answer_key = answer_key
        def self.answer_key
            @answer_key
        end
        @grades = grades
        def self.grades
            @grades
        end
    end
    
    # Method for scoring a set of answers against the answer_key, and then adding the score
    # to the array of scores for the object
    # Takes one argument - an array of answers (strings)
    # Returns the score
    def score(answers)
        
        # Raises error if too many answers are supplied
        if answers.length > answer_key.length
            raise ArgumentError.new('Too many answers');
        end
        
        # Checks the supplied answers against the answer_key
        # If they match, then it add 1 to the number of correct answers
        correctAnswers = 0
        for i in 0..answer_key.length - 1
            if answers[i] === answer_key[i]
                correctAnswers += 1.0
            end
        end
        
        # Checks to make sure single letter answers are supplied
        # A nil answer is not considered invalid, so it doesn't raise an error for that
        for i in 0..answers.length - 1
            if (answers[i] != nil) && (answers[i].length > 1)
                raise ArgumentError.new("#{answers[i]} is and invalid answer");
            end
        end
        
        # Calculates the percent of correct answers
        percent = ( correctAnswers / answer_key.length ) * 100
        # Checks to see if the grades variable is nil
        # If it is not, then it pushes the score to the Array
        # If it is, then it creates a new array, and then pushes the scrore to that array
        if grades != nil
            grades.push(percent)
        else
            grades = Array.new
            grades.push(percent)
        end
        # Returns the score
        return percent
        
    end
    
    # Method for getting the average of the supplied grades
    # Takes no arugments
    # Returns the average score
    def average_score()
        
        total_score = 0
        for i in 0..grades.length - 1
            total_score += grades[i]
        end
        
        average = total_score / grades.length
        
        return average
        
    end
    
    # Method for finding the highest score
    # Takes no arguments
    # returns the highest score
    def high_score()
        
        return grades.max
        
    end
    
    # Method for finding the lowest score
    # Takes no arguments
    # Returns the lowest score
    def low_score()
        
        return grades.min
        
    end
    
    # Method for applying a curve to the grades
    # Takes no arguments
    # Returns the grades with the curve applied
    def curve()
        
        if grades.max != 100
            curve = 100 - grades.max
            for i in 0..grades.length - 1
                grades[i] += curve
            end
        end
        
        return grades
        
    end
    
    # Method for finding how many points were applied to the curve
    # Takes no arguments
    # Returns the number of points in the curve
    def curve_points()
        
        old_grades_max = grades.max
        curve_grades = self.curve()
        curve_points = curve_grades.max - old_grades_max
        return curve_points
        
    end
    
    # Method for applying a letter grade to a number grade
    # Takes one argument - the grade (an integer)
    # Returns a letter grade (string)
    def self.letter_grade(grade)
        
        if grade > 89
            grade = "A"
        elsif (90 > grade) && (grade > 79)
            grade = "B"
        elsif (80 > grade) && (grade > 74)
            grade = "C"
        elsif (75 > grade) && (grade > 69)
            grade = "D"
        else
            grade = "F"
        end
        
        return grade
        
    end
    
end

# grader = Grader.new(["A", "B", "C"], grades: [75, 100, 20])
# grader = Grader.new(["A", "B", "C"])

# puts grader.score(["A", "B", "D"])


