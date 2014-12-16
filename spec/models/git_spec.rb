require 'rails_helper'

RSpec.describe Git, :type => :model do
  let(:git) { Git.new(".") }

  context "#head" do
    it "works" do
      expect(git.repo).to receive(:head)
      git.head
    end
  end

  context "#tags" do
    it "works" do
      expect(git.repo).to receive(:tags)
      git.tags
    end
  end

  context "#remote_fetch" do
    it "works" do
      expect(git.repo).to receive(:remote_fetch).with("origin")
      git.remote_fetch("origin")
    end
  end

  context "#log" do
    it "works" do
      expect(git.repo).to receive(:log)
      git.log
    end
  end

  context "#commit" do
    it "works" do
      Rails.cache.clear
      expect(git.repo).to receive(:commit).with("abc")
      git.commit("abc")
    end
  end

  context "#blame" do
    it "works" do
      expect(git.repo).to receive(:blame).with("git_spec.rb", nil)
      git.blame("git_spec.rb")
    end
  end
end
