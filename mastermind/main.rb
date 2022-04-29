class CodeMaker
    COLORS=['red','orange','white','purple','yellow']
    def initialise(name)
        @name=name
    end
    def random_from_colors
        code_maker_colors=COLORS.sample(4)
    end
end
