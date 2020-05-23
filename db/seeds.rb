# There are many print statements so that I can see them in console
# My computer is old, and I'm never sure if it's crashing.  It does that

# Seed Setup
create_users = true
create_projects = true
create_forums = true
create_likes_on_forums = true

# Main Test Account
default_username = "ThatNewjackSwing"
User.create(username: default_username , email: "spicuzza157@gmail.com" , password: "Password1!") if !!User.find_by(username: default_username)

# User Seeding
def generate_users(user_count = 1)
    user_count.times do |user_index|
        name = Faker::Internet.username(specifier: 8..20)
        user = User.create(username: name , email: Faker::Internet.safe_email(name: name) , password: "Password1!")
    end
end

# Project Seeding
def generate_project
    puts "Generating Project"
    test_project = Project.create(user_id: User.first.id , title: "Test Project 1" , summary: "A sample project generated from the seed")
    
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
    end
end

# Generate Forums
def generate_forums(forum_count = 1, threads_per_forum = 10 , posts_per_thread = 10)
    forum_count.times do |forum|
        puts ">> Creating Forum (#{forum})"
        forum_area = Forum.create(title: "Forum Area #{forum + 1}")
    
        # Forum-Thread Generation
        puts "   Creating Threads"
        threads_per_forum.times do |thread|
            new_thread = ForumThread.create(user_id: User.first.id , title: "Title #{thread + 1}!" , content: Faker::Lorem.paragraphs(number: 5) , forum_id: forum_area.id);
            
            puts "     Creating Posts (#{forum} : #{thread}) * #{posts_per_thread}"
            # Post Seeding
            posts_per_thread.times do |forum_post|
                new_post = ForumPost.create(user_id: User.first.id , forum_thread_id: new_thread.id ,  content: Faker::Lorem.paragraphs(number: 5))
                3.times do
                    Comment.create(content: "I'm a Comment!" , commentable: new_post)
                end
            end
        end
    end
end

# Generate Likes
def generate_likes(min_likes = 0)
    max_likes = User.all.count

    Comment.all.each do |comment|
        like_count = rand(min_likes..max_likes).to_i
        target_comment = Comment.find_by(id: comment + 1)
        like_count.times do |like|
            Like.create(user_id: User.find_by(id: like + 1).id , likable: target_comment)
        end
    end

end

# Generate Updates


# Seed Generation Chain
if generate_users
    20.times do |user|
        generate_users(5)
    end
end

    
if create_projects
    10.times do |index|
        puts ">> Creating project #{index}"
        generate_project
    end 
end
    
generate_forums(10 , 10 , 10) if generate_forums
