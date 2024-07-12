codeunit 50105 "Copilot Capabilities Setup"
{
    Subtype = Install;
    InherentEntitlements = X;
    InherentPermissions = X;
    Access = Internal;

    trigger OnInstallAppPerDatabase()
    begin
        RegisterCapability();
    end;

    local procedure RegisterCapability()
    var
        CopilotCapability: Codeunit "Copilot Capability";
    begin
        if not CopilotCapability.IsCapabilityRegistered(Enum::"Copilot Capability"::"Create Contact") then
            CopilotCapability.RegisterCapability(Enum::"Copilot Capability"::"Create Contact", Enum::"Copilot Availability"::Preview, '');
    end;
}