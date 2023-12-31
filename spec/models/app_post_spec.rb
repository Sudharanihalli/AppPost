require 'rails_helper'

RSpec.describe AppPost, type: :model do
  let(:draft_post) { create(:app_post, published_at: nil) } 
  let(:published_post) { create(:app_post, published_at: Time.current - 1.hour) }
  let(:scheduled_post) { create(:app_post, published_at: Time.current + 1.hour) }

  describe '#draft?' do
    it 'returns true for a draft post' do
      expect(draft_post.draft?).to be(true)
    end

    it 'returns false for a published post' do
      expect(published_post.draft?).to be(false)
    end

    it 'returns false for a scheduled post' do
      expect(scheduled_post.draft?).to be(false)
    end
  end

  describe '#published?' do
    it 'returns false for a draft post' do
      expect(draft_post.published?).to be(false)
    end

    it 'returns true for a published post' do
      expect(published_post.published?).to be(true)
    end

    it 'returns false for a scheduled post' do
      expect(scheduled_post.published?).to be(false)
    end
  end

  describe '#schedule?' do
    it 'returns false for a draft post' do
      expect(draft_post.schedule?).to be(false)
    end

    it 'returns false for a published post' do
      expect(published_post.schedule?).to be(false)
    end

    it 'returns true for a scheduled post' do
      expect(scheduled_post.schedule?).to be(true)
    end
  end

      describe 'published_at scope' do
        it 'includes posts with a published_at value' do
          post_with_published_at = create(:app_post, published_at: Time.current)
          expect(AppPost.published).to include(post_with_published_at)
        end
    
        it 'excludes posts without a published_at value' do
          post_without_published_at = create(:app_post, published_at: nil)
          expect(AppPost.published).not_to include(post_without_published_at)
        end
      end
    end
