defmodule ElStoreSpec do
  use ESpec

  before do
    ElStore.start_link
    ElStore.flushall
  end

  describe ".get" do
    before do
      ElStore.set(:admin, "Test")
    end

    it "returns correct value" do
      expect(ElStore.get(:admin)) |> to(eq "Test")
    end
  end

  describe ".set" do
    it "returns correct storage" do
      expect(ElStore.set(:admin, "Vlad")) |> to(eq %{admin: "Vlad"})
    end
  end

  describe ".delete" do
    before do
      ElStore.set(:user, "Vika")
    end

    it "returns empty storage" do
      expect(ElStore.delete(:user)) |> to(eq %{})
    end
  end

  #describe ".exists?" do
    #before do
    #  ElStore.set(:world, "Hello")
    #end

    #it "returns boolean" do
    #  expect(ElStore.exists?(:world)) |> to(eq true)
    #end
  #end

  describe ".exists?" do
    before do
      ElStore.set(:world, "Hello")
    end

    context "with existing key" do
      it "returns true" do
        expect(ElStore.exists?(:world)) |> to(eq true)
      end
    end

    context "without existing key" do
      it "returns false" do
        expect(ElStore.exists?(:non_existing_key)) |> to(eq false)
      end
    end
  end

  describe ".flushall" do
    before do
      ElStore.set(:planet, "Mars")
    end

    it "returns empty storage" do
      expect(ElStore.flushall) |> to(eq %{})
    end
  end
end
