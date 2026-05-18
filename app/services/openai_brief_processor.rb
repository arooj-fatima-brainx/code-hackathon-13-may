# app/services/openai_brief_processor.rb

class OpenAIBriefProcessor
  def initialize(brief)
    @brief = brief
    @client = OpenAI::Client.new
  end

  def process
    # TODO: Implement actual OpenAI API call and response parsing
    # Example:
    # response = @client.chat(parameters: { model: "gpt-4.1-mini", messages: [{ role: "user", content: prompt_for_openai }]})
    # structured_data = parse_response(response)
    # @brief.update(structured_data: structured_data, status: 'processed')
    # structured_data

    # Placeholder for now:
    { tasks: [{ description: "Implement user authentication", status: "pending" }, { description: "Design database schema", status: "pending" }] }
  end

  private

  def prompt_for_openai
    # Craft a detailed prompt for OpenAI based on the raw brief text
    # "Convert the following client brief into a structured list of developer tasks in JSON format, each with a 'description' and 'status'.\n\nBrief: #{@brief.raw_text}"
    "Convert the following client brief into a structured list of developer tasks in JSON format, each with a 'description' and 'status'. Please ensure the status is 'pending'.\n\nBrief: #{@brief.raw_text}"
  end

  def parse_response(response)
    # Parse the OpenAI response to extract structured tasks
    # response['choices'][0]['message']['content']
    # JSON.parse(content)
  end
end