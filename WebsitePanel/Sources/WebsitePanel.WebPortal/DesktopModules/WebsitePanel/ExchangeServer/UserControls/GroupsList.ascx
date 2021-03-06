<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GroupsList.ascx.cs" Inherits="WebsitePanel.Portal.ExchangeServer.UserControls.GroupsList" %>
<%@ Register Src="../../UserControls/PopupHeader.ascx" TagName="PopupHeader" TagPrefix="wsp" %>

<asp:UpdatePanel ID="GroupsUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
    <ContentTemplate>
    
	<div class="FormButtonsBarClean">
		<asp:Button ID="btnAdd" runat="server" Text="Add..." CssClass="Button1" OnClick="btnAdd_Click" meta:resourcekey="btnAdd"  />
		<asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="Button1" OnClick="btnDelete_Click" meta:resourcekey="btnDelete"/>
	</div>
	<asp:GridView ID="gvGroups" runat="server" meta:resourcekey="gvAccounts" AutoGenerateColumns="False"
		Width="600px" CssSelectorClass="NormalGridView"
		DataKeyNames="AccountName">
		<Columns>
			<asp:TemplateField>
				<HeaderTemplate>
					<asp:CheckBox ID="chkSelectAll" runat="server" onclick="javascript:SelectAllCheckboxes(this);" />
				</HeaderTemplate>
				<ItemTemplate>
					<asp:CheckBox ID="chkSelect" runat="server" />
					<asp:Literal ID="litAccountType" runat="server" Visible="false" Text='<%# Eval("AccountType") %>'></asp:Literal>
				</ItemTemplate>
				<ItemStyle Width="10px" />
			</asp:TemplateField>
			<asp:TemplateField meta:resourcekey="gvGroupsDisplayName" HeaderText="gvGroupsDisplayName">
				<HeaderStyle Wrap="false" />
				<ItemStyle Width="100%" Wrap="false"></ItemStyle>
				<ItemTemplate>
					<asp:Image ID="img1" runat="server" ImageUrl='<%# GetAccountImage((int)Eval("AccountType")) %>' ImageAlign="AbsMiddle" />
					<asp:Literal ID="litDisplayName" runat="server" Text='<%# Eval("DisplayName") %>'></asp:Literal>
				</ItemTemplate>
			</asp:TemplateField>
		</Columns>
	</asp:GridView>


<asp:Panel ID="AddGroupsPanel" runat="server" CssClass="Popup" style="display:none">
	<table class="Popup-Header" cellpadding="0" cellspacing="0">
		<tr>
			<td class="Popup-HeaderLeft"></td>
			<td class="Popup-HeaderTitle">
				<asp:Localize ID="headerAddGroups" runat="server" meta:resourcekey="headerAddGroups"></asp:Localize>
			</td>
			<td class="Popup-HeaderRight"></td>
		</tr>
	</table>
	<div class="Popup-Content">
		<div class="Popup-Body">
			<br />
    <asp:UpdatePanel ID="AddGroupsUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            <div class="FormButtonsBarClean">
                <div class="FormButtonsBarCleanRight">
                    <asp:Panel ID="SearchPanel" runat="server" DefaultButton="cmdSearch">
                        <asp:DropDownList ID="ddlSearchColumn" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem Value="DisplayName" meta:resourcekey="ddlSearchColumnDisplayName">DisplayName</asp:ListItem>
                        </asp:DropDownList><asp:TextBox ID="txtSearchValue" runat="server" CssClass="NormalTextBox" Width="100"></asp:TextBox><asp:ImageButton ID="cmdSearch" Runat="server" meta:resourcekey="cmdSearch" SkinID="SearchButton"
	                        CausesValidation="false" OnClick="cmdSearch_Click"/>
                    </asp:Panel>
                </div>
            </div>
            <div class="Popup-Scroll">
				<asp:GridView ID="gvPopupGroups" runat="server" meta:resourcekey="gvPopupGroups" AutoGenerateColumns="False"
					Width="100%" CssSelectorClass="NormalGridView"
					DataKeyNames="AccountName">
					<Columns>
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:CheckBox ID="chkSelectAll" runat="server" onclick="javascript:SelectAllCheckboxes(this);" />
							</HeaderTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chkSelect" runat="server" />
								<asp:Literal ID="litAccountType" runat="server" Visible="false" Text='<%# Eval("AccountType") %>'></asp:Literal>
							</ItemTemplate>
							<ItemStyle Width="10px" />
						</asp:TemplateField>
						<asp:TemplateField meta:resourcekey="gvGroupsDisplayName">
							<ItemStyle Width="100%"></ItemStyle>
							<ItemTemplate>
								<asp:Image ID="img1" runat="server" ImageUrl='<%# GetAccountImage((int)Eval("AccountType")) %>' ImageAlign="AbsMiddle" />
								<asp:Literal ID="litDisplayName" runat="server" Text='<%# Eval("DisplayName") %>'></asp:Literal>
							</ItemTemplate>
						</asp:TemplateField>
					</Columns>
				</asp:GridView>
			</div>
	    </ContentTemplate>
    </asp:UpdatePanel>
			<br />
		</div>
		
		<div class="FormFooter">
			<asp:Button ID="btnAddSelected" runat="server" CssClass="Button1" meta:resourcekey="btnAddSelected" Text="Add Accounts" OnClick="btnAddSelected_Click" />
			<asp:Button ID="btnCancelAdd" runat="server" CssClass="Button1" meta:resourcekey="btnCancel" Text="Cancel" CausesValidation="false" />
		</div>
	</div>
</asp:Panel>

<asp:Button ID="btnAddAccountsFake" runat="server" style="display:none;" />
<ajaxToolkit:ModalPopupExtender ID="AddGroupsModal" runat="server"
	TargetControlID="btnAddAccountsFake" PopupControlID="AddGroupsPanel"
	BackgroundCssClass="modalBackground" DropShadow="false" CancelControlID="btnCancelAdd" />

	</ContentTemplate>
</asp:UpdatePanel>