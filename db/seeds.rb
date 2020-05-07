# User Seeding
user_1 = User.create(username: "ThatNewjackSwing" , email: "spicuzza157@gmail.com" , password: "Password1!")
# user_2 = User.create(username: "CowboyBlank" , email: "testemail@gmail.com" , password: "password")
# user_3 = User.create(username: "CrunchyPringles" , email: "testemail@gmail.com" , password: "password")

# Project Seeding


def generate_project
    puts "Generating Project"
    test_project = Project.create(user_id: User.first.id , title: "Test Project 1" , summary: "A sample project generated from the seed")
    #test_book_1 = Book.create(project_id: test_project_1.id , title: "Test Project 1 Book", summary: "A generated book from the seed")
    
    puts "Generating Seed Books"
    # Book Seeding
    3.times do |book|
        test_book = Book.create(project_id: test_project.id , title: "Test Project 1 Book #{book + 1}", summary: "A generated book from the seed")
        
        puts "Generating Seed Chapters (#{book})"
        # Chapter Seeding
        10.times do |chapter|
            test_chapter = Chapter.create(book_id: test_book.id , title: "Chapter #{chapter + 1}", content: Faker::Lorem.paragraphs(number: 20))
        end
    end
    
    # Document Seeding
    puts "Generating Documents"
    3.times do |document|
        test_document = Document.create(project_id: test_project.id , title: "Test Document #{document + 1}" , summary: "Generated Test Document")
        # 20.times do |textarea|
        #     new_text_area = TextArea.create(document_id: test_document.id)
        # end
    end
end

10.times do |index|
    puts ">> Creating project #{index}"
    generate_project
end

# Generate Forums
20.times do |forum|
    puts ">> Creating Forum (#{forum})"
    forum_area = Forum.create(title: "Forum Area #{forum + 1}")

    # Forum-Thread Generation
    puts "Creating Threads"
    20.times do |thread|
        new_thread = ForumThread.create(user_id: User.first.id , title: "Title #{thread + 1}!" , content: Faker::Lorem.paragraphs(number: 5) , forum_id: forum_area.id);
        
        puts "Creating Posts"
        # Post Seeding
        50.times do |forum_post|
            new_post = ForumPost.create(user_id: User.first.id , content: Faker::Lorem.paragraphs(number: 5))
        end
    end
end