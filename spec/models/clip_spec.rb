require 'spec_helper'

describe Clip do
  it { should validate_presence_of :video_embed_code }
end
