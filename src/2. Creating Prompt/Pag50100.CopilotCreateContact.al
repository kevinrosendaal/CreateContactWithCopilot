page 50100 "Copilot Create Contact"
{
    PageType = PromptDialog;
    Extensible = false;
    IsPreview = true;
    Caption = 'Create Contact with Copilot';
    PromptMode = Prompt;

    layout
    {
        area(Prompt)
        {
            field(ChatRequest; ChatRequest)
            {
                ShowCaption = false;
                MultiLine = true;
                ApplicationArea = All;
                InstructionalText = 'Provide the unstructured contact information.', Locked = true;
            }
        }
        area(Content)
        {
            part(CreateContactSub; "Copilot Create Contact Sub.")
            {
                Caption = 'Contact';
                ShowFilter = false;
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

    actions
    {
        area(SystemActions)
        {
            systemaction(Generate)
            {
                Caption = 'Create Contact';

                trigger OnAction()
                var
                    CopilotCreateContact: Codeunit "Copilot Create Contact";
                begin
                    Result := CopilotCreateContact.sendRequest(ChatRequest);
                    CurrPage.CreateContactSub.Page.Load(Result);
                end;
            }

            systemaction(OK)
            {
                Caption = 'Save';
            }
            systemaction(Cancel)
            {
                Caption = 'Discard';
            }
        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        CopilotCreateContact: Record "Copilot Create Contact";
    begin
        if CloseAction = CloseAction::OK then begin
            CurrPage.CreateContactSub.Page.CopyRecord(CopilotCreateContact);
            CreateContact(CopilotCreateContact)
        end;
    end;

    local procedure CreateContact(var CopilotCreateContact: Record "Copilot Create Contact")
    begin
        Error('Procedure CreateContact not implemented.');
    end;

    var
        ChatRequest: Text;
        Result: Text;
}