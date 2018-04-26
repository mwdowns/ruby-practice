class Grader

    # Initiallizes the variables that that a new object of this class
    # uses, an answer_key and grades - grades set to nil.
    attr_reader :answer_key
    attr_reader :grades
    def initialize(answer_key, grades: nil)
        @answer_key = answer_key
        @grades = grades
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

        # Checks to make sure single letter answers are supplied
        # A nil answer is not considered invalid, so it doesn't raise an error for that
        # Checks the supplied answers against the answer_key
        # If they match, then it add 1 to the number of correct answers
        correctAnswers = 0
        answers.each_with_index do |answer, index|
            if (!answer.nil?) && (answer.length > 1)
                raise ArgumentError.new("#{answer} is and invalid answer");
            end
            if answer === answer_key[index]
                correctAnswers += 1.0
            end
        end

        # Calculates the percent of correct answers
        percent = ( correctAnswers / answer_key.length ) * 100
        # Checks to see if the grades variable is nil
        # If it is not, then it pushes the score to the Array
        # If it is, then it creates a new array, and then pushes the scrore to that array
        if !grades.nil?
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
        grades.each { |grade| total_score += grade }
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
            grades.map! { |grade| grade += curve }
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


