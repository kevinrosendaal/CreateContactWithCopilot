page 50101 "Copilot Create Contact Sub."
{
    PageType = ListPart;
    Extensible = false;
    ApplicationArea = All;
    Caption = 'Copilot Create Contact Subpage';
    SourceTable = "Copilot Create Contact";
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = ' ';
                ShowCaption = false;

                field("Name"; Rec.Name)
                {
                }
                field(Value; Rec.Value)
                {
                }
            }
        }
    }

    internal procedure Load(Result: Text)
    var
        JSON: Codeunit Json;
    begin
        Rec.Reset();
        Rec.DeleteAll();

        JSON.InitializeObject(Result);

        Rec.Id := 1;
        Rec.Name := 'Company Name';
        JSON.GetStringPropertyValueByName('companyName', Rec.Value);
        Rec.Insert();

        Rec.Id := 2;
        Rec.Name := 'Name';
        JSON.GetStringPropertyValueByName('name', Rec.Value);
        Rec.Insert();

        Rec.Id := 3;
        Rec.Name := 'Street';
        JSON.GetStringPropertyValueByName('street', Rec.Value);
        Rec.Insert();

        Rec.Id := 4;
        Rec.Name := 'City';
        JSON.GetStringPropertyValueByName('city', Rec.Value);
        Rec.Insert();

        CurrPage.Update(false);
    end;

    internal procedure CopyRecord(var CopilotCreateContact: Record "Copilot Create Contact")
    begin
        CopilotCreateContact.Copy(Rec, true);
    end;
}