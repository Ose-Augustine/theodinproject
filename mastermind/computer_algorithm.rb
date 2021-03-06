require_relative 'human_feedback.rb'
include HumanFeedback
module ComputerAlgorithm 
    POSSIBLE_CODES=(1111..6666).to_a
    def computer_to_play_initially
        computer_initial_choice=1122
    end
    def examine_pegs(chosen_codes,feedback,play)
        selected_codes=[]
        play=play.to_s.split('')
        chosen_codes.each do |code|
            red_peg=0
            white_peg=0
            check_form=code.to_s.split('')
            check_form.each_with_index do |digit,position|
                if digit==play[position] 
                    red_peg += 1
                end
                if play.include?(digit) && digit != play[position]
                    white_peg += 1
                end
            end
            if [red_peg,white_peg].eql?(feedback)
                selected_codes.push(code)
            end
        end
        selected_codes
    end
    def current_code_guess(selected_codes)
        selected_codes[0]
    end
    def computer_start_game
        p"Computer registers as code breaker!"
        p"Please input your code..."
        HumanFeedback.human_choice
        p computer_to_play_initially
        HumanFeedback.human_feedback
    end
    def computer_subsequent_turns
        round=2
        current_feedback=computer_start_game
        chosen_codes=examine_pegs(POSSIBLE_CODES,current_feedback,computer_to_play_initially)
        round += 1
        chosen_code=chosen_codes[0]
        until current_feedback[0]==4
            p chosen_code
            current_feedback=HumanFeedback.human_feedback
            filtered_codes=examine_pegs(chosen_codes,current_feedback,chosen_code)
            chosen_codes=filtered_codes
            chosen_code=current_code_guess(filtered_codes)
        end
        p"Codebreaker wins this round"
    end
end



