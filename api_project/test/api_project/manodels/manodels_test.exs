defmodule ApiProject.ManodelsTest do
  use ApiProject.DataCase

  alias ApiProject.Manodels

  describe "workingtimes" do
    alias ApiProject.Manodels.Workingtime

    @valid_attrs %{end: ~N[2010-04-17 14:00:00.000000], start: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{end: ~N[2011-05-18 15:01:01.000000], start: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{end: nil, start: nil}

    def workingtime_fixture(attrs \\ %{}) do
      {:ok, workingtime} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Manodels.create_workingtime()

      workingtime
    end

    test "list_workingtimes/0 returns all workingtimes" do
      workingtime = workingtime_fixture()
      assert Manodels.list_workingtimes() == [workingtime]
    end

    test "get_workingtime!/1 returns the workingtime with given id" do
      workingtime = workingtime_fixture()
      assert Manodels.get_workingtime!(workingtime.id) == workingtime
    end

    test "create_workingtime/1 with valid data creates a workingtime" do
      assert {:ok, %Workingtime{} = workingtime} = Manodels.create_workingtime(@valid_attrs)
      assert workingtime.end == ~N[2010-04-17 14:00:00.000000]
      assert workingtime.start == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_workingtime/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Manodels.create_workingtime(@invalid_attrs)
    end

    test "update_workingtime/2 with valid data updates the workingtime" do
      workingtime = workingtime_fixture()
      assert {:ok, workingtime} = Manodels.update_workingtime(workingtime, @update_attrs)
      assert %Workingtime{} = workingtime
      assert workingtime.end == ~N[2011-05-18 15:01:01.000000]
      assert workingtime.start == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_workingtime/2 with invalid data returns error changeset" do
      workingtime = workingtime_fixture()
      assert {:error, %Ecto.Changeset{}} = Manodels.update_workingtime(workingtime, @invalid_attrs)
      assert workingtime == Manodels.get_workingtime!(workingtime.id)
    end

    test "delete_workingtime/1 deletes the workingtime" do
      workingtime = workingtime_fixture()
      assert {:ok, %Workingtime{}} = Manodels.delete_workingtime(workingtime)
      assert_raise Ecto.NoResultsError, fn -> Manodels.get_workingtime!(workingtime.id) end
    end

    test "change_workingtime/1 returns a workingtime changeset" do
      workingtime = workingtime_fixture()
      assert %Ecto.Changeset{} = Manodels.change_workingtime(workingtime)
    end
  end

  describe "workingtimes" do
    alias ApiProject.Manodels.Workingtime

    @valid_attrs %{end: "2010-04-17 14:00:00.000000Z", start: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{end: "2011-05-18 15:01:01.000000Z", start: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{end: nil, start: nil}

    def workingtime_fixture(attrs \\ %{}) do
      {:ok, workingtime} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Manodels.create_workingtime()

      workingtime
    end

    test "list_workingtimes/0 returns all workingtimes" do
      workingtime = workingtime_fixture()
      assert Manodels.list_workingtimes() == [workingtime]
    end

    test "get_workingtime!/1 returns the workingtime with given id" do
      workingtime = workingtime_fixture()
      assert Manodels.get_workingtime!(workingtime.id) == workingtime
    end

    test "create_workingtime/1 with valid data creates a workingtime" do
      assert {:ok, %Workingtime{} = workingtime} = Manodels.create_workingtime(@valid_attrs)
      assert workingtime.end == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert workingtime.start == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_workingtime/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Manodels.create_workingtime(@invalid_attrs)
    end

    test "update_workingtime/2 with valid data updates the workingtime" do
      workingtime = workingtime_fixture()
      assert {:ok, workingtime} = Manodels.update_workingtime(workingtime, @update_attrs)
      assert %Workingtime{} = workingtime
      assert workingtime.end == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert workingtime.start == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_workingtime/2 with invalid data returns error changeset" do
      workingtime = workingtime_fixture()
      assert {:error, %Ecto.Changeset{}} = Manodels.update_workingtime(workingtime, @invalid_attrs)
      assert workingtime == Manodels.get_workingtime!(workingtime.id)
    end

    test "delete_workingtime/1 deletes the workingtime" do
      workingtime = workingtime_fixture()
      assert {:ok, %Workingtime{}} = Manodels.delete_workingtime(workingtime)
      assert_raise Ecto.NoResultsError, fn -> Manodels.get_workingtime!(workingtime.id) end
    end

    test "change_workingtime/1 returns a workingtime changeset" do
      workingtime = workingtime_fixture()
      assert %Ecto.Changeset{} = Manodels.change_workingtime(workingtime)
    end
  end
end
