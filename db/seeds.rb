# User Seeding
user_1 = User.create(username: "ThatNewjackSwing" , email: "testemail@gmail.com" , password: "password")
user_2 = User.create(username: "CowboyBlank" , email: "testemail@gmail.com" , password: "password")

# Project Seeding
test_project_1 = Project.create(user_id: 1 , title: "Test Project 1" , summary: "A sample project generated from the seed")
#test_book_1 = Book.create(project_id: test_project_1.id , title: "Test Project 1 Book", summary: "A generated book from the seed")

# Book Seeding
3.times do |book|
    test_book = Book.create(project_id: test_project_1.id , title: "Test Project 1 Book", summary: "A generated book from the seed")
    
    # Chapter Seeding
    10.times do |chapter|
        test_chapter = Chapter.create(book_id: test_book.id , title: "Chapter #{chapter}", content: Faker::Lorem.paragraphs(number: 20))
    end
end

# Document Seeding
3.times do |document|
    test_document = Document.create(project_id: test_project_1.id , title: "Test Document #{document}" , summary: "Generated Test Document")
end


20.times do |forum|
    forum_area = Forum.create(title: "Forum Area #{forum}")

    20.times do |thread|
        new_thread = ForumThread.create(user_id: User.first.id , title: "Title!" , content: Faker::Lorem.paragraphs(number: 5) , forum_id: forum_area.id);
        50.times do |forum_post|
            new_post = ForumPost.create(user_id: User.first.id , content: Faker.Lorem(paragraphs(number: 5)))
        end
    end
end