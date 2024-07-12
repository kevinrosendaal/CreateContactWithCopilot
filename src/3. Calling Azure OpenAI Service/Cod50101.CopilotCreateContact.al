codeunit 50101 "Copilot Create Contact"
{
    internal procedure SendRequest(UserPrompt: Text): Text
    var
        AzureOpenAI: Codeunit "Azure OpenAI";
        AOAIOperationResponse: Codeunit "AOAI Operation Response";
        AOAIChatCompletionParams: Codeunit "AOAI Chat Completion Params";
        AOAIChatMessages: Codeunit "AOAI Chat Messages";
        Result: Text;
    begin
        AzureOpenAI.SetAuthorization(Enum::"AOAI Model Type"::"Chat Completions", '', '', Format(''));
        AzureOpenAI.SetCopilotCapability(Enum::"Copilot Capability"::"Create Contact");

        AOAIChatCompletionParams.SetJsonMode(true);

        AOAIChatMessages.AddSystemMessage(GetSystemPrompt());
        AOAIChatMessages.AddUserMessage(UserPrompt);

        AzureOpenAI.GenerateChatCompletion(AOAIChatMessages, AOAIChatCompletionParams, AOAIOperationResponse);

        if AOAIOperationResponse.IsSuccess() then
            Result := AOAIChatMessages.GetLastMessage()
        else
            Error(AOAIOperationResponse.GetError());

        exit(Result);
    end;

    local procedure GetSystemPrompt(): Text
    begin
        exit(StrSubstNo('Your task is to generate a response based on the users input. ' +
                        'The user will provide an unstructured e-mail signature which can contain information such as company name, name, phone number, address. ' +
                        'I want you to return the companyName, name, street, postCode, city, phoneNumber and website in a JSON-object.' +
                        'If you can''t find any of the properties, leave the value blank. Do not wrap the response in JSON-markers.'));
    end;
}