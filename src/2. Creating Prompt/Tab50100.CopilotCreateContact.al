table 50100 "Copilot Create Contact"
{
    TableType = Temporary;

    fields
    {
        field(1; Id; Integer)
        {
            Caption = 'Id';
            Editable = false;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            Editable = false;
        }
        field(3; Value; Text[100])
        {
            Caption = 'Value';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; Id)
        {
            Clustered = true;
        }
    }
}