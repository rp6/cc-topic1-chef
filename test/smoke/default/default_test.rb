# # encoding: utf-8

# Inspec test for recipe topic1_cb::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/
# Author Rieser


# This is an example test, replace it with your own test.
describe port(80) do
  it { should be_listening }
end

describe package('git') do
  it { should be_installed }
end

describe user('kappel') do
  it { should exist }
  its('shell') { should eq '/bin/zsh' }
end


describe file('/message/test.txt') do
    it { should exist }
    it { should be_file }
     its('content') { should match %r{.*Rieser.*} }
     
  end
