class ContributorGuides < ActiveRecord::Base
  belongs_to :guide
  belongs_to :contributor

  def upvote
    if vote < 1
      vote+=1
      save!
    else
      false
    end
  end

  def downvote
    if vote > 1
      vote-=1
      save!
    else
      false
    end
  end

  def self.votecount(g_id)
    count= 0
    ContributorGuides.all.each {|contributor| contributor.vote}

  end

end
