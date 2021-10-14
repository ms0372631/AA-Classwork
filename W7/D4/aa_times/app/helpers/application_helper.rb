module ApplicationHelper
    def bottom_nav_list
        list = ["World", "U.S.", "Politics", "N.Y.", "Business", "Opinion", "Tech", "Science", "Health", "Sports", "Arts", "Style", "Food", "Travel", "Magazine", "T Magazine", "Real Estate"]
        str = ""
        list.each do |ele|
            str += "<li><a href='#'><span>#{ele}</span></a></li>"
        end
        str.html_safe
    end
end
