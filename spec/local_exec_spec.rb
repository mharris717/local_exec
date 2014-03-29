

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "LocalExec" do
  it 'smoke' do
    2.should == 2
    LocalExec.should be
  end
end

describe 'Command' do
  it 'smoke' do
    ARGV = ["--addl","a,b"]
    LocalExec::Command.new.addl_gems.should == %w(a b)
  end

  it 'smoke' do
    ARGV = ["--addl","a,b","z","--local","c,d"]
    LocalExec::Command.new.tap do |c|
      c.addl_gems.should == %w(a b)
      c.local_gems.should == %w(c d)
      c.remaining_args.should == ["z"]
    end
  end
end

describe "Gemfile" do
  let(:gemfile) do
    LocalExec::Gemfile.new.tap do |g|
      g.source_body = "gem 'a'\ngem 'b'"
      g.addl_gems = %w(c)
      g.local_gems = %w(b)
    end
  end

  it 'smoke' do
    gemfile.evaluate!
    gemfile.body.split("\n").tap do |lines|
      lines.size.should == 3
      lines.should be_include("gem 'a'")
      lines.should be_include("gem 'c'")
      lines.should be_include('gem \'b\', git: "https://#{ENV[\'GITHUB_TOKEN\']}:x-oauth-basic@github.com/mharris717/b.git", branch: :master')
      File.create "#{LocalExec.root}/tmp/GemfileSpec",gemfile.body

      #gem name, git: "https://#{ENV['GITHUB_TOKEN']}:x-oauth-basic@github.com/mharris717/#{name}.git", branch: :master
    end
  end
end