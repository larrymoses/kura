/// <summary>
/// Enum Staff Exit Types (ID 50008).
/// </summary>
enum 50008 "Staff Exit Types"
{
    Extensible = true;
    value(0; " ")
    {
        Caption = '';
    }
    value(1; Resignation)
    {
        Caption = 'Resignation';
    }
    value(2; Retirement)
    {
        Caption = 'Retirement';
    }
    value(3; Termination)
    {
        Caption = 'Termination';
    }
    value(4; Retrenchment)
    {
        Caption = 'Retrenchment';
    }
    value(5; "Non-renewal of contract")
    {
        Caption = 'Non-renewal of contract';
    }
    value(6; Death)
    {
        Caption = 'Death';
    }
}
