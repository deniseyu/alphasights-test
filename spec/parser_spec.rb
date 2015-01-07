require './app/models/parser'

describe Parser do

  it 'should convert markdown to HTML' do
    parser = Parser.new
    expect(parser.markdown_to_HTML("##hello")).to eq "<h2>hello</h2>\n"
  end

end