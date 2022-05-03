module HumanFeedback 
    def human_feedback
        p"How many red pegs?"
        red_tag=gets.chomp
        p"How many white pegs?"
        white_tag=gets.chomp
        [red_tag.to_i,white_tag.to_i]
    end
    def human_choice
        human_code=gets.chomp
    end
end