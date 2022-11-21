class Product
    attr_reader :description, :price

    # Types of products that are exempted from tax rates
    EXEMPT_PRODUCTS = ['book', 'food', 'chocolate', 'pill', 'medical']

    def initialize(description, price)
        @description = description.strip
        @price = price.strip
    end

    def final_price
        # Calculate the final price
        price = (@price.to_f + calculate_product_taxes).round(2)
    end

    def tax_value
        # Calculate the tax value
        final_price - @price.to_f
    end

    private

    def is_imported
        @description.include? 'imported'
    end

    def is_exempted
        EXEMPT_PRODUCTS.any? { |exempt| @description.include? exempt }
    end

    def calculate_product_taxes
        import_tax_value = 0
        base_tax_value = 0

        if is_imported
            import_tax_value = ((5 * @price.to_f / 100) * 20).ceil.to_f / 20.0
        end

        if not is_exempted
            base_tax_value = ((10 * @price.to_f / 100) * 20).ceil.to_f / 20.0
        end

        final_tax_value = base_tax_value + import_tax_value
    end

end
