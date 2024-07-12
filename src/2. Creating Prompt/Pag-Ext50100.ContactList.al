pageextension 50100 "Contact List" extends "Contact List"
{
    actions
    {
        addfirst("C&ontact")
        {
            action("Create with Copilot")
            {
                ApplicationArea = All;
                Image = Sparkle;

                trigger OnAction()
                var
                    CopilCreateContact: Page "Copilot Create Contact";
                begin
                    CopilCreateContact.RunModal();
                end;
            }
        }

        addfirst(Category_Process)
        {
            actionref(MyPromotedActionRef; "Create with Copilot")
            {
            }
        }

    }
}